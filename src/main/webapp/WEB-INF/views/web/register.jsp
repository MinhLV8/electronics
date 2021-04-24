<%@ page pageEncoding="utf-8" %>
<%@ include file="/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
<%@ include file="/includes/web/header.jsp" %>
<!-- Cart Overlay -->
<div class="cart-overlay"></div>
<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center justify-content-center">
        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Đăng ký</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/trangchu">Trang chủ</a></li>
                        <li><a href="#">Đăng ký</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End -->
<!-- Register Section Start -->
<div class="register-section section mt-90 mb-90">
    <div class="container">
        <div class="row">
            <!-- Register -->
            <div class="col-md-6 col-12 d-flex">
                <div class="ee-register">
                    <h3>Điền thông tin của bạn để tạo tài khoản</h3>
                    <!-- Register Form -->
                    <c:if test="${not empty mes}">
                        <script type="text/javascript">
                            Swal.fire({
                                icon: 'error',
                                text: '${mes}',
                                title: 'Lỗi !!!'
                            })
                        </script>
                    </c:if>
                    <form action="/dangkyTaikhoan" method="post" id="signupForm">
                        <div class="row">
                            <div class="col-12 mb-30">
                                <input type="text" name="name" id="name" placeholder="Nhập tên của bạn"
                                       autocomplete="off" required>
                            </div>
                            <div class="col-12 mb-30">
                                <input type="text" name="username" id="username" placeholder="Nhập tên đăng nhập"
                                       autocomplete="off" required>
                            </div>
                            <div class="col-12 mb-30">
                                <input type="password" name="password" id="password" placeholder="Nhập mật khẩu"
                                       required></div>
                            <div class="col-12 mb-30">
                                <input type="password" name="password1" id="password1" placeholder="Nhập lại mật khẩu"
                                       required></div>
                            <div class="col-12"><input type="submit" value="Đăng ký"></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-1 col-12 d-flex">
                <div class="login-reg-vertical-boder"></div>
            </div>
            <!-- Account Image -->
            <div class="col-md-5 col-12 d-flex">
                <div class="ee-social-login">
                    <h3>Ngoài ra bạn có thể đăng ký bằng...</h3>
                    <a href="#" class="facebook-login">Đăng ký bằng <i class="fa fa-facebook"></i></a>
                    <a href="#" class="twitter-login">Đăng ký <i class="fa fa-twitter"></i></a>
                    <a href="#" class="google-plus-login">Đăng nhập ký <i class="fa fa-google-plus"></i></a>
                </div>
            </div>
        </div>
    </div>
</div><!-- Register Section End -->
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $("#signupForm").validate({
            rules: {
                name: "required",
                username: {
                    required: true,
                    minlength: 8
                },
                password: {
                    required: true,
                    minlength: 8
                },
                password1: {
                    required: true,
                    minlength: 8,
                    equalTo: "#password"
                },
            },
            messages: {
                name: "Vui lòng nhập tên của bạn",
                username: {
                    required: "Vui lòng nhập tên đăng nhập",
                    minlength: "Tên người dùng của bạn phải có ít nhất 5 ký tự"
                },
                password: {
                    required: "Vui lòng nhập mật khẩu",
                    minlength: "Mật khẩu của bạn phải có ít nhất 8 ký tự"
                },
                password1: {
                    required: "Vui lòng xác nhận mật khẩu",
                    minlength: "Mật khẩu của bạn phải có ít nhất 8 ký tự",
                    equalTo: "Hãy điền vào mật khẩu giống ở trên"
                },
            },
            errorElement: "em",
            errorPlacement: function (error, element) {
                // Add the `invalid-feedback` class to the error element
                error.addClass("invalid-feedback");

                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.next("label"));
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass("is-invalid").removeClass("is-valid");
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).addClass("is-valid").removeClass("is-invalid");
            }
        });
    })
</script>
<%@ include file="/includes/web/footer.jsp" %>
