<%@ page pageEncoding="UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<html>
<head>
    <title>Giỏ hàng</title>
</head>
<body>
<%@ include file="/includes/web/header.jsp" %>
<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center justify-content-center">
        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Giỏ hàng</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Giỏ hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End -->
<!-- Cart Page Start -->
<div class="page-section section pt-90 pb-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="alert alert-danger" role="alert">
                    Không có sản phẩm nào trong giỏ hàng, xem sản phẩm tại <a href="/trangchu" class="alert-link">đây</a>.
                </div>
                <div class="row justify-content-end">
                    <!-- Cart Summary -->
                    <div class="col-lg-6 col-12 mb-40 d-flex">
                        <div class="cart-summary">
                            <div class="cart-summary-wrap">
                                <h4>Tóm tắt giỏ hàng</h4>
                                <p>Tổng tiền sản phẩm <span>0</span></p>
                                <p>Phí vận chuyển <span>0</span></p>
                                <h2>Grand Total <span>0</span></h2>
                            </div>
                            <div class="cart-summary-button">
                                <button class="checkout-btn">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart Page End -->
<%@ include file="/includes/web/footer.jsp" %>
</body>
</html>
