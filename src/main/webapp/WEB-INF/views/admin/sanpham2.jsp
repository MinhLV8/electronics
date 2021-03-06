<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:34 PM
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
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <!-- //jQuery -->
    <!-- <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />

    <!-- tables -->
    <link rel="stylesheet" type="text/css" href="css/table-style.css" />
    <link rel="stylesheet" type="text/css" href="css/basictable.css" />
    <script type="text/javascript" src="js/jquery.basictable.min.js"></script>

</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">



                <div class="profile_details w3l">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">
                                    <span class="prfil-img"><img src="images/in4.jpg" alt=""> </span>
                                    <div class="user-name">
                                        <p>Th??ng tin</p>
                                        <span>Admin</span>
                                    </div>
                                    <i class="fa fa-angle-down"></i>
                                    <i class="fa fa-angle-up"></i>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <ul class="dropdown-menu drp-mnu">
                                <li> <a href="#"><i class="fa fa-cog"></i> C??i ?????t</a> </li>
                                <li> <a href="#"><i class="fa fa-user"></i> Th??ng tin</a> </li>
                                <li> <a href="#"><i class="fa fa-sign-out"></i> ????ng xu???t</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="clearfix"> </div>
            </div>
            <!--heder end here-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index1.html">Trang ch???</a><i class="fa fa-angle-right"></i>Qu???n l?? nh?? s???n xu???t</li>
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
                                        <h2>Th??m nh?? s???n xu???t</h2>
                                        <div class="row">
                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                                            </div>
                                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                <form action="">
                                                    <div class="form-group">
                                                        <label for="ma">M?? nh?? s???n xu???t:</label>
                                                        <input type="text" class="form-control" id="ma">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="ten">T??n nh?? s???n xu???t:</label>
                                                        <input type="text" class="form-control" id="ten">
                                                    </div>

                                                    <button type="submit" class="btn btn-default">Th??m nh?? s???n xu???t</button>
                                                </form>
                                            </div>
                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                                            </div>
                                        </div>
                                        <h2>C???p nh???t nh?? s???n xu???t</h2>
                                        <table id="table">
                                            <thead >
                                            <tr >
                                                <th>M?? nh?? s???n xu???t</th>
                                                <th>T??n nh?? s???n xu???t</th>

                                                <th>Ch???nh s???a</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="info">
                                                <td>1</td>
                                                <td>DELL</td>

                                                <td style="text-align: center;">
							<span >
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    <span>
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-times-circle"></i></a>
							</span>

                                                </td>
                                            </tr>
                                            <tr class="info">
                                                <td>2</td>
                                                <td>ASUS</td>

                                                <td style="text-align: center;">
							<span >
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    <span>
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-times-circle"></i></a>
							</span>

                                                </td>
                                            </tr>
                                            <tr class="info">
                                                <td>3</td>
                                                <td>HP</td>

                                                <td style="text-align: center;">
							<span >
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    <span>
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-times-circle"></i></a>
							</span>

                                                </td>
                                            </tr>
                                            <tr class="info">
                                                <td>4</td>
                                                <td>APPLE</td>

                                                <td style="text-align: center;">
							<span >
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    <span>
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-times-circle"></i></a>
							</span>

                                                </td>
                                            </tr>
                                            <tr class="info">
                                                <td>5</td>
                                                <td>LENOVO</td>

                                                <td style="text-align: center;">
							<span >
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil-square-o"></i></a>
							</span>
                                                    <span>
								<a class="agile-icon" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-times-circle"></i></a>
							</span>

                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">C???p nh???t th??ng tin nh?? s???n xu???t</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>M???i b???n nh???p th??ng tin nh?? s???n xu???t: </p>
                                                    <form action="">
                                                        <div class="form-group">
                                                            <label for="ma">M?? nh?? s???n xu???t:</label>
                                                            <input type="text" class="form-control" id="ma">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="ten">T??n nh?? s???n xu???t:</label>
                                                            <input type="text" class="form-control" id="ten">
                                                        </div>

                                                        <button type="submit" class="btn btn-default">Th??m nh?? s???n xu???t</button>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- end mymodal -->
                                    <!-- sanpham -->
                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal1" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">B???n c?? ch???c ch???n mu???n x??a hay kh??ng?</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <form action="">
                                                        <button type="submit" class="btn btn-default" style="margin-left: 43%;">X??a
                                                        </button>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
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
                <p>?? 2018 N5QPT. All Rights Reserved  Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
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
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->
<!-- morris JavaScript -->
<script src="js/raphael-min.js"></script>

</body>
</html>