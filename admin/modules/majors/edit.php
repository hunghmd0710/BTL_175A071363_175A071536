<?php
require_once("inc_security.php");      
include_once('../../layout/layout_top.php');
$maj_id        = getValue("id", "int", "GET", 0);

//Lay du lieu tin can sua
$query      = "SELECT * FROM majors WHERE maj_id = " . $maj_id;
$dataMaj  = $database->getOneRow($query);


if(count($dataMaj) <=0 ){
   echo 'Khong co sinh vien';
   die();
}


$maj_name              = getValue("maj_name", "str", "POST", "", 1);
$maj_man               = getValue("maj_man", "str", "POST", "", 1);
$maj_tinc              = getValue("maj_tinc", "int", "POST", "", 1);
$maj_time              = getValue("maj_time", "date", "POST", "", 1);
$action                = getValue("action", "str", "POST", "");
if($action == "edit"){
   if( $maj_name  != ''){
      $sql  = "UPDATE  majors SET maj_name  = '" . $maj_name  . "',
               maj_man = '" . $maj_man . "',maj_tinc = '" . $maj_tinc ."',maj_time = '" . $maj_time . "'
               WHERE maj_id = " . $maj_id ;
      $result = $database->execute($sql);
      echo 'Da cap nhat thanh cong';
      //Lay du lieu tin can sua
      $query      = "SELECT * FROM majors WHERE maj_id = " . $maj_id;
      $dataMaj  = $database->getOneRow($query);

      redirect("/admin/modules/majors/listing.php");
   }else{
      echo 'Chua nhap ten';
   }
}   
?>
<div  class="main_content">
   <h1>Sửa thông tin</h1>
   
   <form action="" method="POST">
      <table class="middle-table-center">
         <tbody>
            <tr>
               <td class="info" align="right">Tên môn học: &nbsp;</td>
               <td>
                  <input class="form_input_txt"  type="text" name="maj_name" value="<?=$dataMaj['maj_name']?>">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Mã môn học: &nbsp;</td>
               <td>
                  <textarea name="maj_man" class="maj_man"><?=$dataMaj['maj_man']?></textarea>
               </td>
            </tr>

            <tr>
               <td class="int" align="right">Số tín chỉ: &nbsp;</td>
               <td>
                  <textarea name="maj_tinc" class="maj_tinc"><?=$dataMaj['maj_tinc']?></textarea>
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Thời gian: &nbsp;</td>
               <td>
                  <input type="date" name="maj_time" value="<?=$dataMaj['maj_time']?>">
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
      td {
      padding-bottom: 10px;
   }
</style>