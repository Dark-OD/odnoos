<?php
    $GLOBALS['acl']->PagePermission('user_new_roletoaction');
    $model     = new model();
	$model->role_id = intval($_GET['roleid']);
    if(isset($_POST['btnsave'])){
    $model->Save($_POST);
	}
?>
<form method="post">
    <table border="0" class="newRecord" >
      <?php
	  foreach($model->ComponentName() as $Component){
		  echo "<tr><th colspan=\"2\" align=\"center\">".$Component->component_name_fa."</th></tr>";
	   foreach($model->ListActions($Component->component_id) as $roles){ ?>
      <tr>   
        <td><?php echo $roles->action_name_fa ?></td>               
        <td><?php echo $roles->action_name ?></td>
		<td><input type="checkbox" name="chk_action[]" value="<?php echo $roles->action_id ?>"
        <?php 
		foreach($model->ListActionToRole() as $actiontorole){
		  if($actiontorole->action_id == $roles->action_id){echo "checked";}	
		}
		 ?>
         /></td>
      </tr>
      <?php } 
	  }
	  ?>
      <tr>                  
        <td></td>
		<td><input type="submit" name="btnsave" value="ثبت" /></td>
      </tr>
    </table>
</form>

 