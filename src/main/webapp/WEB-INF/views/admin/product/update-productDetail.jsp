<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
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
        .w3l-table-info h4{
            color: red;
        }
        .form-group input[type=text]{
            width: 844px;
            height: 34px;
        }
    </style>
    <script>
        function format_curency(a) {
            a.value = a.value.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        }
    </script>
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
                                    <div class="w3l-table-info">
                                        <div class="row">
                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                                            </div>
                                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                <mvc:form modelAttribute="productInformationID" method="post" action="/admin/update-productInformation">
                                                    <div class="form-group">
                                                        <label>ID:</label>
                                                        <mvc:input path="id" class="form-control" required="true" readonly="true"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Ram:</label>
                                                        <mvc:input path="ram" class="form-control" required="true" placeholder="Nhập ram"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Màu:</label>
                                                        <mvc:input path="color" class="form-control" required="true" placeholder="Nhập màu sản phẩm"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Bảo hành:</label>
                                                        <mvc:input path="guarantee" class="form-control" required="true" placeholder="Nhập hệ điều hành sản phẩm"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>CPU:</label>
                                                        <mvc:input path="cpu" class="form-control" required="true" placeholder="Nhập cpu sản phẩm"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>AMD:</label>
                                                        <mvc:input path="amd" class="form-control" required="true" placeholder="Nhập amd sản phẩm"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Hệ điều hành:</label>
                                                        <mvc:select path="operatingSystem" class="form-control">
                                                            <mvc:options items="${operatingSystem}"/>
                                                        </mvc:select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tên sản phẩm:</label>
                                                        <mvc:select path="product.id" class="form-control">
                                                            <mvc:options items="${productList}"/>
                                                        </mvc:select>
                                                    </div>
                                                    <button type="submit" class="btn btn-default">Cập nhập</button>
                                                </mvc:form>
                                            </div>
                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                                            </div>
                                        </div>
                                    </div>
                                    <!-- end modal sanpham -->
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
