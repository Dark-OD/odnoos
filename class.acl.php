<?php  
class ACL extends db{
    function UserGroupInfo(){
        $f[] = 'group_id';
        $this->query("SELECT * FROM user_set_group WHERE user_id = '".$_SESSION['user_id']."' ");
        $group_id = $this->LoadResult("group_id");
        return $group_id;
    }

    function UserRole(){
		
         parent::query("
         SELECT aur.user_role_id,
         aur.user_id,
         aur.role_id, 
         aur.creation_date, 
         ar.role_id,
         ar.name, 
         ar.description, 
         ar.creation_date, 
         ar.create_by, 
         ara.role_action_id, 
         ara.role_id, 
         ara.action_id,
         ara.creation_date,
         aral.action_name
         FROM acl_user_role aur 
         LEFT JOIN acl_role ar ON ( aur.role_id = ar.role_id  )  
         LEFT JOIN acl_role_action ara ON ( ar.role_id = ara.role_id  )  
         LEFT JOIN acl_role_action_list aral ON ( ara.action_id = aral.action_id  )  
         WHERE user_id =  '".$_SESSION['user_id']."'
         ");
         foreach (parent::LoadResult() as $item){
            $groupRule[] =  $item->action_name;
        }
        return $groupRule;
    }
    function GroupRule(){
         $group_id = self::UserGroupInfo();// گروه کاربری این کاربر را بدست می اورد
         parent::query("
         SELECT arg.role_group_id,
         arg.group_name,
         arg.group_id, 
         arg.role_id,
         arg.creation_by,
         arg.creation_date, 
         ar.role_id,
         ar.name, 
         ar.description,
         ar.creation_date, 
         ar.create_by, 
         ara.role_action_id, 
         ara.role_id,
         ara.action_id, 
         ara.creation_date, 
         aral.action_name
         FROM acl_role_group arg 
		 LEFT JOIN acl_role ar ON ( arg.role_id = ar.role_id  )  
		 LEFT JOIN acl_role_action ara ON ( ar.role_id = ara.role_id  )  
		 LEFT JOIN acl_role_action_list aral ON ( ara.action_id = aral.action_id  )  
		 WHERE group_id = '$group_id'
        ");
        foreach (parent::LoadResult() as $item){
           $groupRule[] =  $item->action_name;
        }
        return($groupRule);
    }
    function ListUserAllowed(){
          foreach (self::GroupRule() as $item ){
              $array[] = $item;
          }
        foreach (self::UserRole() as $item ){
            $array[] = $item;
        }
        return($array);
    }
    function chekActionList($name){
       $rec =  parent::query("SELECT * FROM acl_role_action_list WHERE action_name = '$name' ");
       $result = parent::LoadResult("action_name");
        if(mysql_num_rows($rec) == '0'){
            $data['action_name'] = $name;
            $id = $this->insert("acl_role_action_list",$data);
            return $name;
        }else{
            return $result;
        }
    }

    function PagePermission($name){
       $name = self::chekActionList($name);
        if(self::AllowedCheck($name)) {
             return true;
        }
		else{
            Redirect($this->SITE_URL."/404.php");
            exit("Access Denied");
            return false;
        }
    }
    function ViewPermission($name){
        $name = self::chekActionList($name);
        if(self::AllowedCheck($name)) {
            return true;
        }else{
            return false;
        }
    }
    function AllowedCheck($name){
        $alowdArray = self::ListUserAllowed();
           if(in_array($name,$alowdArray)){
                self::SaveLog($name,'1');
                return true;
           }else{
               self::SaveLog($name,'0');
               return false;
           }
    }
    function SaveLog($action_id,$access_status,$message=''){
        $data['user_id']       = $_SESSION['user_id'];
        $data['action_id']     = $action_id;
        $data['access_status'] = $access_status;
        $data['message']       = $message;
        $this->insert("acl_user_log",$data);

    }
}

?>