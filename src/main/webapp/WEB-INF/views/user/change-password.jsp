<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 10/12/2020
  Time: 9:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đổi mật khẩu</title>
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
                <h1>Đổi mật khẩu</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Đổi mật khẩu</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End --><!-- Page Banner Section End -->
<!-- Register Section Start -->
<div class="register-section section mt-90 mb-90">
    <div class="container">
        <c:if test="${not empty mes}">
            <script type="text/javascript">
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi rồi bạn ơi!',
                    text: '${mes}',
                })
            </script>
        </c:if>
        <div class="row">
            <!-- Register -->
            <div class="col-md-6 col-12 d-flex">
                <div class="ee-register">
                    <h3>Thông tin tài khoản của bạn</h3>
                    <!-- Register Form -->
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-12 mb-30">
                                <label>Tài khoản:</label>
                                <input type="text" name="username" value="<%=SecurityUtils.getPrincipal().getUsername()%>" readonly>
                            </div>
                            <div class="col-12 mb-30">
                                <label>Họ và tên:</label>
                                <input type="text" name="name" value="<%=SecurityUtils.getPrincipal().getName()%>" readonly>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-1 col-12 d-flex">
                <div class="login-reg-vertical-boder"></div>
            </div>
            <!-- Account Image -->
            <div class="col-md-5 col-12 d-flex">
                <div class="ee-register">
                    <h3>Đổi mật khẩu</h3>
                    <form action="/user/change_password" method="post">
                        <div class="row">
                            <div class="col-12 mb-30"><input type="password" name="password1" placeholder="Nhập mật khẩu cũ" required>
                            </div>
                            <div class="col-12 mb-30"><input type="password" name="password2" placeholder="Nhập mật khẩu mới" required>
                            </div>
                            <div class="col-12 mb-30">
                                <input type="password" name="password3" placeholder="Nhập lại mật khẩu mới" required></div>
                            <div class="col-12"><input type="submit" value="Đổi mật khẩu"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div><!-- Register Section End -->
<%@ include file="/includes/web/footer.jsp" %>
