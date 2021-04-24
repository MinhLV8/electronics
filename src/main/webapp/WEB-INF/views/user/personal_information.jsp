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
    <title>Thông tin cá nhân</title>
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
                <h1>Profile</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Thông tin cá nhân</a></li>
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
                    <h3>Thông tin tài khoản của bạn</h3>
                    <!-- Register Form -->
                    <c:if test="${not empty mes}">
                        <script type="text/javascript">
                            Swal.fire({
                                icon: 'success',
                                title: '${mes}',
                                showConfirmButton: false,
                                timer: 1500
                            })
                        </script>
                    </c:if>
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
                            <div class="col-12"><a class="btn btn-warning btn-circle" href="/user/doimatkhau">Đổi
                                mật khẩu</a></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-1 col-12 d-flex">
                <div class="login-reg-vertical-boder"></div>
            </div>
            <!-- Account Image -->
            <div class="col-md-5 col-12 d-flex">
                <div class="ee-account-image">
                    <%--<h3>Upload your Image</h3>--%>
                    <img src="${pageContext.request.contextPath}/web/assets/images/account-image-placeholder.jpg" alt="Account Image Placeholder" class="image-placeholder">
                    <%--<div class="account-image-upload">
                        <input type="file" name="chooseFile" id="account-image-upload" disabled="true">
                        <label class="account-image-label" for="account-image-upload">Choose your image</label>
                    </div>
                    <p>jpEG 250x250</p>--%>
                </div>
            </div>
        </div>
    </div>
</div><!-- Register Section End -->
<%@ include file="/includes/web/footer.jsp" %>
</body>