<%@ page import="com.electronics.util.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>MinhLV8-Shop</title>
    <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Charmonman:wght@700&family=Quicksand:wght@500&display=swap"
          rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/sweetalert/sweetalert2.min.css"/>
    <script crossorigin="anonymous"
            src="${pageContext.request.contextPath}/admin/sweetalert/sweetalert2.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
            type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/simple.money.format.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckeditor/ckeditor.js"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/trangchu"> Trang Admin</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i>
    </button>
    <p class="navbar-brand">Shop thiết bị điện tử</p>
    <!-- Navbar-->
    <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <li>
            <!-- <p id="clock" class="nav-item"></p> -->
            <a id="clock" class="navbar text-white" style="margin-left:5px;">Đang tải...</a>
            <script type="text/javascript">
                function refrClock() {
                    var d = new Date();
                    var s = d.getSeconds();
                    var m = d.getMinutes();
                    var h = d.getHours();
                    var day = d.getDay();
                    var date = d.getDate();
                    var month = d.getMonth();
                    var year = d.getFullYear();
                    var days = ["Chủ nhật,", "Thứ 2,", "Thứ 3,", "Thứ 4,", "Thứ 5,", "Thứ 6,", "Thứ 7,"];
                    var months = ["tháng 1", "tháng 2", "tháng 3", "tháng 4", "tháng 5", "tháng 6", "tháng 7", "tháng 8", "tháng 9", "tháng 10", "tháng 11", "tháng 12"];
                    var am_pm;
                    if (s < 10) {
                        s = "0" + s
                    }
                    if (m < 10) {
                        m = "0" + m
                    }
                    if (h > 12) {
                        h -= 12;
                        am_pm = "pm"
                    } else {
                        am_pm = "am"
                    }
                    if (h < 10) {
                        h = "0" + h
                    }
                    document.getElementById("clock").innerHTML = days[day] +
                        " ngày " + date + " " + months[month] + " năm " + year + " | " + h + ":" + m + ":" + s + " " + am_pm;
                    setTimeout("refrClock()", 1000);
                }

                refrClock();
            </script>
            </center>
        </li>
        <li><a class="nav-link text-white" disabled><i class="fal fa-grip-lines-vertical"></i></a></li>
        <li class="nav-item dropdown">
            <a class="nav-link text-white" href="#"><i class="fas fa-user-circle"></i>
                Xin chào: <%=SecurityUtils.getPrincipal().getName()%>
            </a>
        </li>
        <li><a class="nav-link text-white" disabled><i class="fal fa-grip-lines-vertical"></i></a></li>
        <li>
            <a class="nav-link text-white" href="/logout">Đăng xuất <i class="fas fa-sign-out-alt"></i></a>
        </li>
    </ul>
</nav>