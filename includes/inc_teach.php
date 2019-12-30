<?php
    require_once "../config/config.php";  
    $pageTile = '.: Hệ thống đăng ký học :.';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php
    require_once "../includes/inc_head.php";
    ?>
</head>
<body >
	
	
	<?php
    require_once "../includes/inc_header.php";
    ?>
    <main>
        <div class="main">
            <table id="Tbteach" cellSpacing="0" width="100%">
                <tbody>
                    <tr>
                        <div align="left " style="padding-top: 60px;">
                            <form action="/includes/teach.php" method="get" >Thông tin giảng viên (họ, tên): <input type="text" name="search" />
                            <input type="submit" name="ok" value="Tìm kiếm" />
                        </form>
                    </div>
                    <tr>
                        <td height="20"></td>
                    </tr>
                    <tr>
                        <td align="left"><span id="lblOrderBy">Sắp xếp theo</span>
                        <input id="rdoHoTen" type="radio" name="orderby" value="rdoHoTen" checked="checked" /><label for="rdoHoTen">Họ, tên</label>
                        <input id="rdoKhoa_BoMon" type="radio" name="orderby" value="rdoKhoa_BoMon" /><label for="rdoKhoa_BoMon">Khoa, bộ môn</label>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="3">
                        <img id="img" src="../images/Teacher_schedule.jpg" />
                    </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div style="margin-top: 30px;">
        </div>
    </div>
</main>
</body>
</html>
<?php
    require_once "../includes/inc_footer.php";
    ?>
