<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
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
                <h1>Chi tiết đơn hàng</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Chi tiết đơn hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End --><!-- Compare Page Start -->
<div class="page-section section mt-90 mb-90">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="cart-table table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="pro-thumbnail">Hình ảnh</th>
                            <th class="pro-title">Sản phẩm</th>
                            <th class="pro-price">Giá</th>
                            <th class="pro-quantity">Số lượng</th>
                            <th class="pro-subtotal">Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="orderDetail" items="${orderDetailList}">
                        <tr>
                            <td class="pro-thumbnail"><a href="#"><img style="width: 50px" src="/getImage/${imageService.urlImage(orderDetail.product.id).url}" alt="Product"></a></td>
                            <td class="pro-title"><a href="#">${orderDetail.product.name}</a></td>
                            <td class="pro-price"><span><fmt:formatNumber type="number" groupingUsed="true" value="${orderDetail.product.price}" /></span></td>
                            <td class="pro-quantity">${orderDetail.quantity}</td>
                            <td class="pro-addtocart"><fmt:formatNumber type="number" groupingUsed="true" value="${orderDetail.unitPrice}" /></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row justify-content-end">
                    <div class="col-lg-6 col-12 mb-40 d-flex">
                        <div class="cart-summary">
                            <div class="cart-summary-wrap">
                                <h2>Tổng giá trị đơn hàng:
                                    <span>
                                      <fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}" /> ₫
                                    </span>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Compare Page End -->
<%@ include file="/includes/web/footer.jsp" %>
</body>
</html>