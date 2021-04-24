<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ hàng</title>
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
<c:if test="${not empty mes}">
    <script type="text/javascript">
        Swal.fire({
            icon: 'error',
            title: '${mes}',
        })
    </script>
</c:if>
<div class="page-section section pt-90 pb-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="#">
                    <!-- Cart Table -->
                    <div class="cart-table table-responsive mb-40">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="pro-thumbnail">Hình ảnh</th>
                                <th class="pro-title">Sản phẩm</th>
                                <th class="pro-price">Giá</th>
                                <th class="pro-quantity">Số lượng</th>
                                <th class="pro-subtotal">Tổng</th>
                                <th class="pro-remove">Xoá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cart" items="${cart.orderDetailList}">
                            <tr>
                                <td class="pro-thumbnail">
                                    <a href="#"><img src="/getImage/${imageService.urlImage(cart.product.id).url}" alt="Product"></a></td>
                                <td class="pro-title"><a href="#">${cart.product.name}</a></td>
                                <td class="pro-price"><span><fmt:formatNumber type="number" groupingUsed="true" value="${cart.unitPrice}" />₫</span></td>
                                <td class="pro-quantity">
                                    <div class="pro-qty">
                                        <a class="dec qtybtn" href="/removeItem/${cart.product.id}">-</a>
                                        <input type="text" value="${cart.quantity}">
                                        <a class="inc qtybtn" href="/addItem/${cart.product.id}">+</a>
                                    </div>

                                </td>
                                <td class="pro-subtotal"><span><fmt:formatNumber type="number" groupingUsed="true" value="${cart.moneyTotal}" />₫</span></td>
                                <td class="pro-remove"><a href="/deleteItem/${cart.product.id}"><i class="fa fa-trash-o"></i></a></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row justify-content-end">
                    <!-- Cart Summary -->
                    <div class="col-lg-6 col-12 mb-40 d-flex">
                        <div class="cart-summary">
                            <div class="cart-summary-wrap">
                                <h4>Tóm tắt giỏ hàng</h4>
                                <p>Tổng tiền sản phẩm <span><fmt:formatNumber type="number" groupingUsed="true" value="${totalMoney}" />₫</span></p>
                                <%--<p>Phí vận chuyển <span>30.000₫</span></p>--%>
                                <h2>Grand Total <span><fmt:formatNumber type="number" groupingUsed="true" value="${totalMoney}" />₫</span></h2>
                            </div>
                            <div class="cart-summary-button">
                                <button class="checkout-btn"><a href="/user/thanhtoan">Đặt hàng</a></button>
                                <button class="update-btn"><a href="/">Tiếp tục mua hàng</a></button>
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
