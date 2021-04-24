<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>dashboard</title>
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">
                <div class="clearfix"></div>
            </div>
            <!--heder end here-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/home-admin">Trang chủ</a><i class="fa fa-angle-right"></i>Ảnh
                </li>
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
                                                <mvc:form modelAttribute="image" method="post" action="/admin/update-image" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label>ID:</label>
                                                        <mvc:input path="id" readonly="true"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Ảnh:</label>
                                                        <input type="file" class="form-control" name="inpFile" id="inpFile" required>
                                                    </div>
                                                    <div class="image-preview" id="imagePreview">
                                                        <img src="" alt="Image Preview" class="image-preview_image">
                                                        <span class="span">Image</span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tên sản phẩm:</label>
                                                        <mvc:select path="product.id" class="form-control">
                                                            <mvc:options items="${productList}"/>
                                                        </mvc:select>
                                                    </div>
                                                    <button type="submit" class="btn btn-default">Cập nhập</button>
                                                </mvc:form>
                                                <script>
                                                    const inpFile = document.getElementById("inpFile");
                                                    const previewContent = document.getElementById("imagePreview");
                                                    const previewImage = previewContent.querySelector(".image-preview_image");
                                                    const preview = previewContent.querySelector(".span");

                                                    inpFile.addEventListener("change", function () {
                                                        const file = this.files[0];
                                                        if (file) {
                                                            const reader = new FileReader();
                                                            preview.style.display = "none";
                                                            previewImage.style.display = "block";
                                                            reader.addEventListener("load", function () {
                                                                console.log(this);
                                                                previewImage.setAttribute("src", this.result);
                                                            });
                                                            reader.readAsDataURL(file);
                                                        }
                                                    });
                                                </script>
                                            </div>
                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end modal sanpham -->
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
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
                $(document).ready(function () {
                    var navoffeset = $(".header-main").offset().top;
                    $(window).scroll(function () {
                        var scrollpos = $(window).scrollTop();
                        if (scrollpos >= navoffeset) {
                            $(".header-main").addClass("fixed");
                        } else {
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
                <p>© 2018 N5QPT. All Rights Reserved Design by
                    <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
            </div>
            <!--COPY rights end here-->
        </div>
    </div>
    <!--//content-inner-->
    <!--/sidebar-menu-->
</div>
</body>
</html>
