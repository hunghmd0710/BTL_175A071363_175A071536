<?php
require_once("inc_security.php");      
include_once('../../layout/layout_top.php');


$maj_name         = getValue("maj_name", "str", "POST", "", 1);
$maj_man          = getValue("maj_man", "str", "POST", "", 1);
$maj_tinc	      = getValue("maj_tinc", "int", "POST", "", 1);
$maj_time         = getValue("maj_time", "date", "POST", "", 1);
$action           = getValue("action", "str", "POST", "");
if($action == "add"){
   if( $maj_name != ''){
      $sql  = "INSERT INTO majors (maj_name,maj_man,maj_tinc,maj_time) 
               VALUES ('" . $maj_name . "','" . $maj_man . "','" . $maj_tinc ."','" . $maj_time ."');";
      $result = $database->execute($sql);
      echo 'Da them thanh cong';
   }else{
      echo 'Chua nhap ten mon hoc';
   }
} 
?>
<div  class="main_content">
   <h1>Thêm môn học</h1>
   
   <form action="" method="POST">
      <table class="middle-table-center">
         <tbody>
            <tr>
               <td class="info" align="right">Tên môn học: &nbsp;</td>
               <td>
                  <input type="text" name="maj_name">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Mã môn học: &nbsp;</td>
               <td>
                  <input type="text" name="maj_man">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">số tín chỉ: &nbsp;</td>
               <td>
                  <input type="int" name="maj_tinc">
               </td>
            </tr>
            <tr>
               <td class="info" align="right">Thời gian: &nbsp;</td>
               <td>
                  <input type="date" name="maj_time">
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