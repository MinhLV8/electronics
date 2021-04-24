<%@ page pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
<%@ include file="/includes/web/header.jsp" %>
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center justify-content-center">
        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Đăng nhập</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/trangchu">Trang chủ</a></li>
                        <li><a href="#">Đăng nhập</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page Banner Section End -->
<!-- Login Section Start -->
<div class="login-section section mt-90 mb-90">
    <div class="container">
        <div class="row">
            <!-- Login -->
            <div class="col-md-6 col-12 d-flex">
                <div class="ee-login">
                    <h3>Đăng nhập vào tài khoản của bạn</h3>
                    <c:if test="${not empty mes}">
                        <script type="text/javascript">
                            Swal.fire({
                                icon: 'error',
                                title: 'Lỗi !!!',
                                text:'${mes}'
                            })
                        </script>
                    </c:if>
                    <c:if test="${not empty success}">
                        <script type="text/javascript">
                            Swal.fire({
                                icon: 'success',
                                title: 'Thành công !!!',
                                text:'${success}'
                            })
                        </script>
                    </c:if>
                    <form action="j_spring_security_check" method="post" id="formLogin">
                        <div class="row">
                            <div class="col-12 mb-30">
                                <input type="text" name="j_username" id="j_username" value="${username}" required
                                       placeholder="Tên đăng nhập" autocomplete="off" maxlength="20"></div>
                            <div class="col-12 mb-20">
                                <input type="password" name="j_password" id="j_password" value="${password}" required
                                       placeholder="Mật khẩu"></div>
                            <div class="col-12 mb-15">
                                <input type="checkbox" id="remember_me" name="remember-me">
                                <label for="remember_me">Nhớ tài khoản?</label>
                                <a href="#">Quên mật khẩu?</a>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-circle btn-warning hover-theme" id="btnLogin" type="submit">Đăng
                                    nhập
                                </button>
                            </div>
                        </div>
                    </form>
                    <h4>Chưa có tài khoản? Bấm vào đây để <a href="/dangky">Đăng ký</a></h4>
                </div>
            </div>
            <div class="col-md-1 col-12 d-flex">
                <div class="login-reg-vertical-boder"></div>
            </div>
            <!-- Login With Social -->
            <div class="col-md-5 col-12 d-flex">
                <div class="ee-social-login">
                    <h3>Ngoài ra bạn có thể đăng nhập bằng...</h3>
                    <a href="#" class="facebook-login">Đăng nhập bằng <i class="fa fa-facebook"></i></a>
                    <a href="#" class="twitter-login">Đăng nhập <i class="fa fa-twitter"></i></a>
                    <a href="#" class="google-plus-login">Đăng nhập bằng <i class="fa fa-google-plus"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $("#formLogin").validate({
            rules: {
                j_username: {
                    required: true,
                    minlength: 5
                },
                j_password: {
                    required: true,
                    minlength: 8
                },
            },
            messages: {
                j_username: {
                    required: "Vui lòng nhập tên đăng nhập",
                    minlength: "Tên đăng nhập phải ít nhất 5 ký tự"
                },
                j_password: {
                    required: "Vui lòng nhập mật khẩu",
                    minlength: "Mật khẩu phải ít nhất 8 ký tự"
                },
            },
            errorElement: "em",
            errorPlacement: function (error, element) {
                error.addClass("invalid-feedback");
                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.next("label"));
                } else {
                    error.insertAfter(element);
                }
            },
        });
    })
</script>
<%@ include file="/includes/web/footer.jsp" %>