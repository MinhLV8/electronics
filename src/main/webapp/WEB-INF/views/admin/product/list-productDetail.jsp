<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="laptop" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="/css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="/css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="/js/jquery-2.1.4.min.js"></script>
    <!-- //jQuery -->
    <!-- <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="/css/icon-font.min.css" type='text/css' />

    <!-- tables -->
    <link rel="stylesheet" type="text/css" href="/css/table-style.css" />
    <link rel="stylesheet" type="text/css" href="/css/basictable.css" />
    <script type="text/javascript" src="/js/jquery.basictable.min.js"></script>
    <style>
        #page-pagination{
            text-align: center;
        }
        form input[type=text]{
            width: 300px;
            height: 50px;
            padding-left: 5px;
        }
        form input[type=submit]{
            width: 100px;
            height: 50px;
            background-color: #03A9F4;
            color: #0e0e0e;
            border: none;
        }
        form a input[type=button]{
            width: 100px;
            height: 50px;
            background-color: #03A9F4;
            color: #0e0e0e;
            border: none;
        }
        .agile-tables h4{
            text-align: center;
            color: #68AE00;
        }
        .succc{
            width: 100%;
            height: 35px;
            background-color: #5bc0de;
            border-radius: 10px;
            padding-top: 1.5px;
        }
    </style>
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">



                <jsp:include page="../header-admin/header1.jsp"/>

                <div class="clearfix"> </div>
            </div>
            <!--heder end here-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/home-admin">Trang chủ</a><i class="fa fa-angle-right"></i>Thông tin sản phẩm</li>
            </ol>

            <!-- grids -->
            <div class="grids">



                <div class="agile-calendar-grid">
                    <div class="page">

                        <div class="w3l-calendar-left">
                            <div class="calendar-heading">
                                <!-- 									<p>Noi dung</p>
                                 -->
                                <div class="agile-tables">
                                    <c:if test="${success == 'Saved productInformation successfully!'}">
                                        <div class="succc">
                                            <h4>${success}</h4>
                                        </div>
                                    </c:if>
                                    <div class="w3l-table-info">
                                        <h2><a href="">Thêm thông tin sản phẩm</a></h2>
                                        <form action="/admin/search-productInformation-name/page/1" method="post">
                                            <input type="text" name="search" required placeholder="Nhập tên sản phẩm">
                                            <input type="submit" value="Tìm kiếm">
                                            <a href="/admin/manage-productInformation"><input type="button" value="Xem tất cả"></a>
                                        </form>
                                        <table id="table">
                                            <thead >
                                            <tr >
                                                <th>ID</th>
                                                <th>Ram</th>
                                                <th>Màu</th>
                                                <th>Bảo hành</th>
                                                <th>CPU</th>
                                                <th>AMD</th>
                                                <th>Hệ điều hành</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Chỉnh sửa</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="productInformation" items="${productInformationList.pageList}">
                                                <tr class="info">
                                                    <td>${productInformation.id}</td>
                                                    <td>${productInformation.ram}</td>
                                                    <td>${productInformation.color}</td>
                                                    <td>${productInformation.guarantee}</td>
                                                    <td>${productInformation.cpu}</td>
                                                    <td>${productInformation.amd}</td>
                                                    <td>${productInformation.operatingSystem}</td>
                                                    <td>${productInformation.product.name}</td>
                                                    <td style="text-align: center;">
							<span>
								<a class="agile-icon" href="/admin/edit-productInformation/${productInformation.id}"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div id="page-pagination">
                                            <ul class="pagination">
                                                <li
                                                        th:class="${currentIndex == 1}? 'page-item disabled': 'page-item' ">
                                                    <a class="page-link" aria-label="Previous"
                                                       href="${baseUrl}${currentIndex - 1}"
                                                       title='Go to previous page'><span aria-hidden="true">«</span>
                                                        <span class="sr-only">Previous</span></a>
                                                </li>
                                                <li th:class="${item == currentIndex ? 'page-item active' :'page-item' }">
                                                    <c:forEach var="item" begin="${beginIndex}" end="${endIndex}">
                                                    <a th:class="page-link" href="${baseUrl}${item}"> <span
                                                            th:text='${item}'>${item}</span>
                                                    </a>
                                                    </c:forEach>
                                                </li>
                                                <li
                                                        th:class="${currentIndex == totalPageCount}? 'page-item disabled': 'page-item'">
                                                    <a th:class="page-link" aria-label="Next"
                                                       href="${baseUrl}${currentIndex + 1}" title='Go to next page'><span
                                                            aria-hidden="true">»</span> <span class="sr-only">Next</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //grids -->
            <!--photoday-section-->


            <div class="col-sm-4 wthree-crd">
                <div class="card">
                    <div class="card-body">

                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <!--//photoday-section-->
            <!-- script-for sticky-nav -->
            <script>
                $(document).ready(function() {
                    var navoffeset=$(".header-main").offset().top;
                    $(window).scroll(function(){
                        var scrollpos=$(window).scrollTop();
                        if(scrollpos >=navoffeset){
                            $(".header-main").addClass("fixed");
                        }else{
                            $(".header-main").removeClass("fixed");
                        }
                    });

                });
            </script>
            <!-- /script-for sticky-nav -->
            <!--inner block start here-->
            <div class="inner-block">

            </div>
            <!--inner block end here-->
            <!--copy rights start here-->
            <div class="copyrights">
                <p>© 2018 N5QPT. All Rights Reserved  Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
            </div>
            <!--COPY rights end here-->
        </div>
    </div>
    <!--//content-inner-->
    <!--/sidebar-menu-->
    <jsp:include page="../header-admin/header.jsp"/>
    <div class="clearfix"></div>
</div>
<script>
    var toggle = true;

    $(".sidebar-icon").click(function() {
        if (toggle)
        {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position":"absolute"});
        }
        else
        {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function() {
                $("#menu span").css({"position":"relative"});
            }, 400);
        }

        toggle = !toggle;
    });
</script>
<!--js -->
<script src="/js/jquery.nicescroll.js"></script>
<script src="/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->
<!-- morris JavaScript -->
<script src="/js/raphael-min.js"></script>

</body>
</html>