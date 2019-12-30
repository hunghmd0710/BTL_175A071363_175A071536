<?php
require_once("inc_security.php");      
include_once('../../layout/layout_top.php');
$adm_id        = getValue("id", "int", "GET", 0);

//Lay du lieu tin can sua
$query      = "SELECT * FROM admin WHERE adm_id = " . $adm_id;
$dataadm  = $database->getOneRow($query);


if(count($dataadm) <=0 ){
   echo 'Khong co ten adm';
   die();
}


$adm_name          = getValue("adm_name", "str", "POST", "", 1);
$adm_login_name    = getValue("adm_login_name", "str", "POST", "", 1);
$adm_password      = getValue("adm_password", "str", "POST", "", 1);
$adm_email          = getValue("adm_email", "str", "POST", "", 1);
$adm_type          = getValue("adm_type", "int", "POST", "", 1);
$action           = getValue("action", "str", "POST", "");

if($action == "edit"){
   if( $adm_name != ''){
      $sql  = "UPDATE  admin SET adm_name = '" . $adm_name . "',
               adm_login_name = '" . $adm_login_name . "',adm_password = '" . $adm_password ."',adm_email='" . $adm_email. "',adm_type='" . $adm_type . "'
               WHERE adm_id = " . $adm_id ;
      $result = $database->execute($sql);
      echo 'Da cap nhat thanh cong';
      //Lay du lieu tin can sua
      $query      = "SELECT * FROM admin WHERE adm_id = " . $adm_id;
      $dataadm = $database->getOneRow($query);

      redirect("/admin/modules/admin_user/listing.php");
   }else{
      echo 'Chua nhap tieu de';
   }
}   
?>
<div  class="main_content">
   <h1>Sửa tin tức</h1>
   
   <form action="" method="POST">
      <table class="middle-table-center">
         <tbody>
            <tr>
               <td class="info" align="right">Họ tên: &nbsp;</td>
               <td>
                  <input class="form_input_txt"  type="text" name="adm_name" value="<?=$dataadm['adm_name']?>">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Tài khoản đăng nhập: &nbsp;</td>
               <td>
                  <textarea name="adm_login_name" class="adm_login_name"><?=$dataadm['adm_login_name']?></textarea>
               </td>
            </tr>

            <tr>
               <td class="info" align="right">Mật khẩu: &nbsp;</td>
               <td>
                  <textarea name="adm_password" class="adm_password"><?=$dataadm['adm_password']?></textarea>
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Email: &nbsp;</td>
               <td>
                  <input type="Email" name="adm_email" value="<?=$dataadm['adm_email']?>">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Loại quản lý: &nbsp;</td>
               <td>
                  <select name="adm_type">
                     <?php
                     foreach ($arrAdminType as $key => $value) {
                        ?>
                        <option <?php if($dataadm['adm_type'] == $key ){ echo 'selected="selected" '; } ?> value="<?=$key?>"><?=$value?></option>
                        <?php
                     }
                     ?>
                     
                  </select>
               </td>
            </tr>
            <tr>

               
               <td class="info">
                  <input type="hidden" name="action" value="edit">
                  <input type="submit" name="" value="Cập nhật">
               </td>
               
              
            </tr>
            
         </tbody>
      </table>
      </form>

</div>

<?php

include_once('../../layout/layout_bottom.php');
?>
<style type="text/css">
   .form_input_txt{
      width: 300px;
   }
</style>