<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Đặt hàng</title>
</head>
<body>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/web/header.jsp" %>
<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center justify-content-center">
        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Huỷ đặt hàng</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Huỷ đặt hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End -->
<!-- Checkout Page Start -->
<c:if test="${not empty mes}">
<script type="text/javascript">
    Swal.fire({
        icon: 'error',
        title: '${mes}',
        showConfirmButton: false,
        timer: 1500
    })
</script>
</c:if>
<div class="page-section section mt-90 mb-30">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Checkout Form s-->
                <form:form modelAttribute="order" action="/user/huydonhang" method="post" cssClass="checkout-form">
                    <div class="row row-40">
                        <div class="col-lg-7 mb-20">
                            <!-- Billing Address -->
                            <div id="billing-form" class="mb-40">
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Mã đơn hàng</label>
                                        <input type="text" value="${order.id}" readonly name="id">
                                    </div>
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Email</label>
                                        <input type="email" value="${order.email}" readonly>
                                    </div>
                                    <div class="col-12 mb-20">
                                        <label>Mã xác nhận<span class="text-danger">*</span></label>
                                        <input type="text" name="code" placeholder="Nhập mã" required="true"/>
                                        <button type="submit" class="place-order">Xác nhận</button>
                                        <%--<a class="btn btn-outline-info" href="/user/send-mail/${order.id}">Gửi lại mã</a>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- Shipping Address -->
                        </div>
                        <div class="col-lg-5">
                            <div class="row">
                                <div class="col-12 mb-60">
                                    <h4 class="checkout-title">Thông tin đơn hàng</h4>
                                    <div class="checkout-cart-total">
                                        <h4>Sản phẩm <span>Tổng</span></h4>
                                        <ul>
                                            <c:forEach var="orderDetail" items="${orderDetailList}">
                                                <li><a href="#">${orderDetail.product.name}</a>
                                                    <span><fmt:formatNumber type="number" groupingUsed="true" value="${orderDetail.unitPrice}" />₫</span>
                                                    <strong>(X${orderDetail.quantity})</strong></li>
                                            </c:forEach>
                                        </ul>
                                        <h4>Thành tiền: <span><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}" />₫</span></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!-- Checkout Page End -->
<!-- New Arrival Product Section End -->
<%@ include file="/includes/web/footer.jsp" %>