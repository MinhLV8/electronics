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
                <h1>Đặt hàng</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Đặt hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End -->
<!-- Checkout Page Start -->
<div class="page-section section mt-90 mb-30">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Checkout Form s-->
                <form:form modelAttribute="order" action="/user/checkoutOrderAccount" method="post"
                           cssClass="checkout-form" id="checkoutForm">
                    <div class="row row-40">
                        <div class="col-lg-7 mb-20">
                            <!-- Billing Address -->
                            <div id="billing-form" class="mb-40">
                                <h4 class="checkout-title">Billing Address</h4>
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Họ và tên <span class="text-danger">*</span></label>
                                        <input type="text" placeholder="Họ và tên" name="name" id="name"
                                               value=" <%=SecurityUtils.getPrincipal().getName()%>" required="true"/>
                                    </div>
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Số điện thoại <span class="text-danger">*</span></label>
                                        <form:input type="text" placeholder="Số điện thoại" path="phone" required="true"
                                                id="phone"/>
                                    </div>
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <form:input type="email" placeholder="Email" id="email" path="email" required="true"/>
                                    </div>
                                    <div class="col-md-6 col-12 mb-20">
                                        <label>Xác nhận số điện thoại <span class="text-danger">*</span></label>
                                        <input type="text" placeholder="Nhập lại số điện thoại" required="true"
                                               id="confirm_phone" name="confirm_phone" pattern="[0-9]*"/>
                                    </div>
                                    <div class="col-12 mb-20">
                                        <label>Địa chỉ<span class="text-danger">*</span></label>
                                        <form:input type="text" placeholder="Địa chỉ" path="address" id="address" required="true"/>
                                    </div>
                                </div>
                            </div>
                            <!-- Shipping Address -->
                        </div>
                        <div class="col-lg-5">
                            <div class="row">
                                <div class="col-12 mb-60">
                                    <h4 class="checkout-title">Cart Total</h4>
                                    <div class="checkout-cart-total">
                                        <h4>Sản phẩm <span>Tổng</span></h4>
                                        <ul>
                                            <c:forEach var="cart" items="${cart.orderDetailList}">
                                                <li>${cart.product.name} <span><fmt:formatNumber type="number"
                                                                                                 groupingUsed="true"
                                                                                                 value="${cart.unitPrice}"/>₫</span>
                                                    <strong class="text-danger">(x${cart.quantity})</strong>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <p>Tổng tiền <span><fmt:formatNumber type="number" groupingUsed="true"
                                                                             value="${totalMoney}"/>₫</span></p>
                                        <%--<p>Phí vận chuyển <span>30,000</span></p>--%>
                                        <h4>Thành tiền <span><fmt:formatNumber type="number" groupingUsed="true"
                                                                               value="${totalMoney}"/>₫</span>
                                        </h4>
                                    </div>
                                </div>
                                <!-- Payment Method -->
                                <div class="col-12 mb-60">
                                    <%--<h4 class="checkout-title">Phương thức thanh toán</h4>
                                    <div class="checkout-payment-method">
                                        <div class="single-method">
                                            <input type="radio" id="payment_bank" name="payment-method" value="bank">
                                            <label for="payment_bank">Chuyển khoản trực tiếp</label>
                                            <p data-method="bank">Vui lòng chuyển khoản vào STK 2010206056003 Agribank
                                                Chi nhánh Đà Nẵng
                                                với nội dung thanh toán đơn hàng của bạn.</p>
                                        </div>
                                        <div class="single-method">
                                            <input type="radio" id="payment_cash" name="payment-method" value="cash">
                                            <label for="payment_cash">Thanh toán khi giao hàng</label>
                                            <p data-method="cash">Bạn chỉ việc ở nhà và luôn giữ máy để shiper của chúng
                                                tôi
                                                gọi giao hàng, sau đó chỉ cần thanh toán đơn hàng.</p>
                                        </div>
                                        <div class="single-method">
                                            <input type="radio" id="payment_paypal" name="payment-method"
                                                   value="paypal">
                                            <label for="payment_paypal">Paypal</label>
                                            <p data-method="paypal">Vui lòng chuyển khoản vào STK 2010206056003 Agribank
                                                Chi nhánh Đà Nẵng
                                                với nội dung thanh toán đơn hàng của bạn.</p>
                                        </div>
                                        <div class="single-method">
                                            <input type="checkbox" id="accept_terms">
                                            <label for="accept_terms">Tôi đã đọc và chấp nhận các điều khoản & điều
                                                kiện</label>
                                        </div>
                                    </div>--%>
                                    <button class="place-order">Đặt hàng</button>
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
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        jQuery.validator.addMethod('valid_phone', function (value) {
            var regex = /(09|01[2|6|8|9])+([0-9]{8})\b/;
            return value.trim().match(regex);
        });
        $("#checkoutForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 6
                },
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    minlength:10,
                    maxlength: 10,
                    number:true,
                    valid_phone: true
                },
                confirm_phone: {
                    required: true,
                    equalTo: "#phone"
                },
                address:{
                    required: true,
                    minlength: 20
                }
            },
            messages: {
                name: "Vui lòng nhập tên của bạn",
                address: {
                    required: "Vui lòng nhập địa chỉ",
                    minlength: "Địa chỉ của bạn quá ngắn"
                },
                phone: {
                    required: "Vui lòng nhập số điện thoại",
                    minlength: "Số điện thoại phải có ít nhất 10 ký tự",
                    maxlength: "Số điện thoại chỉ có 10 ký tự",
                    number: "Vui lòng chỉ nhập số"
                },
                confirm_phone: {
                    required: "Vui lòng xác nhận số điện thoại",
                    equalTo: "Hãy điền vào số điện thoại giống ở trên"
                },
                email: "Vui lòng nhập địa chỉ email hợp lệ",
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
        });
    })
</script>
<%@ include file="/includes/web/footer.jsp" %>