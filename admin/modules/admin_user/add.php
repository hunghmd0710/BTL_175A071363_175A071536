<?php
require_once("inc_security.php");      
include_once('../../layout/layout_top.php');


$adm_name          = getValue("adm_name", "str", "POST", "", 1);
$adm_login_name    = getValue("adm_login_name", "str", "POST", "", 1);
$adm_password      = getValue("adm_password", "str", "POST", "", 1);
$adm_email         = getValue("adm_email", "str", "POST", "", 1);
$adm_type          = getValue("adm_type", "int", "POST", "", 1);
$action            = getValue("action", "str", "POST", "");
if($action == "add"){
   if( $adm_name != ''){
      $sql  = "INSERT INTO admin (adm_name,adm_login_name,adm_password,adm_email,adm_type) 
               VALUES ('" . $adm_name . "','" . $adm_login_name . "','" . $adm_password ."','" . $adm_email ."','" . $adm_type ."');";
      $result = $database->execute($sql);
      echo 'Da them thanh cong';
   }else{
      echo 'Chua nhap ten';
   }
}   
?>
<div  class="main_content">
   <h1>Thêm tài khoản</h1>
   
   <form action="" method="POST">
      <table class="middle-table-center">
         <tbody>
            <tr>
               <td class="info" align="right">Admin name: &nbsp;</td>
               <td>
                  <input type="text" name="adm_name">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Tài khoản đăng nhập: &nbsp;</td>
               <td>
                   <input type="text" name="adm_login_name">
               </td>
            </tr>

            <tr>
               <td class="info" align="right">Mật khẩu: &nbsp;</td>
               <td>
                  <input type="password" name="adm_password">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Email: &nbsp;</td>
               <td>
                  <input type="Email" name="adm_email">
               </td>
            </tr>

            <tr>
               <td class="info" align="right">Loại quản lý: &nbsp;</td>
               <td>
                  <select name="adm_type">
                     <?php
                     foreach ($arrAdminType as $key => $value) {
                        ?>
                        <option value="<?=$key?>"><?=$value?></option>
                        <?php
                     }
                     ?>
                     
                  </select>
               </td>
            </tr>

            <tr>
               
               <td class="info">
                  <input type="hidden" name="action" value="add">
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
   td {
      padding-bottom: 10px;
   }
</style>