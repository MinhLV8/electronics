<%@ page import="com.electronics.util.SecurityUtils" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MinhLV8-Shop</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/web/assets/favicon1.ico">
    <!-- CSS ============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/css/icon-font.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/assets/css/style.css">
    <!-- Modernizer JS -->
    <script src="${pageContext.request.contextPath}/web/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <%-- sweetalert --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.12.5/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.12.5/dist/sweetalert2.min.js"></script>
    <script src="${pageContext.request.contextPath}/web/assets/js/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/web/assets/js/jquery.validate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/web/assets/js/jquery.show-more.js" type="text/javascript"></script>
</head>
<body>
<div class="header-section section">
    <!-- Header Top Start -->
    <div class="header-top header-top-one header-top-border pt-10 pb-10">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col mt-10 mb-10">
                    <!-- Header Links Start -->
                    <div class="header-links">
                        <a href="${pageContext.request.contextPath}/user/lichsumuahang"><img src="${pageContext.request.contextPath}/web/assets/images/icons/car.png" alt="Car Icon">
                            <span>Theo dõi đơn hàng</span></a>
                        <a href="${pageContext.request.contextPath}/notification1"><img src="${pageContext.request.contextPath}/web/assets/images/icons/marker.png" alt="Car Icon">
                            <span>Thông báo</span></a>
                    </div><!-- Header Links End -->
                </div>
                <div class="col order-12 order-xs-12 order-lg-2 mt-10 mb-10">
                    <!-- Header Advance Search Start -->
                    <div class="header-advance-search">
                        <form action="/timkiem/page/1" method="post">
                            <div class="input">
                                <input name="search" type="text" placeholder="Tìm kiếm sản phẩm...">
                            </div>
                            <%--<div class="select">
                                <select class="nice-select">
                                    <option>Tất cả thể loại</option>
                                    <c:forEach var="category" items="${categoryName}">
                                        <option>${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>--%>
                            <div class="submit">
                                <button type="submit"><i class="icofont icofont-search-alt-1"></i></button>
                            </div>
                        </form>
                    </div><!-- Header Advance Search End -->
                </div>
                <div class="col order-2 order-xs-2 order-lg-12 mt-10 mb-10">
                    <!-- Header Account Links Start -->
                    <div class="header-account-links">
                        <sec:authorize access="isAuthenticated()">
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_STAFF')">
                                <a href="${pageContext.request.contextPath}/user/thongtincanhan"><i class="icofont icofont-user-alt-7"></i><span>
                            <%=SecurityUtils.getPrincipal().getName()%>
                        </span></a>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_STAFF')">
                                <a href="${pageContext.request.contextPath}/logout"><i class="icofont icofont-login d-none"></i>
                                    <span>Đăng xuất</span></a>
                            </sec:authorize>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <a href="${pageContext.request.contextPath}/dangnhap"><i class="icofont icofont-user-alt-7"></i> <span>Đăng nhập</span></a>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <a href="${pageContext.request.contextPath}/dangky"><i class="icofont icofont-login d-none"></i> <span>Đăng ký</span></a>
                        </sec:authorize>
                    </div><!-- Header Account Links End -->
                </div>
            </div>
        </div>
    </div><!-- Header Top End -->
    <!-- Header Bottom Start -->
    <div class="header-bottom header-bottom-one header-sticky">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col mt-15 mb-15">
                    <!-- Logo Start -->
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/trangchu">
                            <img src="${pageContext.request.contextPath}/web/assets/images/logo-2.png"
                                 alt="logo">
                            <img alt="logo" class="theme-dark"
                                 src="${pageContext.request.contextPath}/web/assets/images/logo1.png">
                        </a>
                    </div><!-- Logo End -->
                </div>
                <div class="col order-12 order-lg-2 order-xl-2 d-none d-lg-block">
                    <!-- Main Menu Start -->
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li class="active"><a href="${pageContext.request.contextPath}/trangchu">TRANG CHỦ</a></li>
                                <li class="menu-item-has-children"><a href="#">Sản phẩm</a>
                                    <ul class="sub-menu">
                                        <c:forEach var="category" items="${categoryName}">
                                            <li class="menu-item-has-children">
                                                <a href="/${category.name}/page/1">${category.name}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#">Thương hiệu</a>
                                    <ul class="mega-menu three-column">
                                        <li>
                                            <ul>
                                                <c:forEach var="brand" items="${brandName}" end="5">
                                                <li><a href="/thuonghieu/${brand.name}/page/1">${brand.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li>
                                            <ul>
                                                <c:forEach var="brand" items="${brandName}" begin="6" end="11">
                                                <li><a href="/thuonghieu/${brand.name}/page/1">${brand.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li>
                                            <ul>
                                                <c:forEach var="brand" items="${brandName}" begin="11">
                                                    <li><a href="/thuonghieu/${brand.name}/page/1">${brand.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#">Tin tức</a>
                                    <ul class="sub-menu">
                                        <li><a href="#">Chưa phát triển</a>
                                        </li>
                                        <li><a href="#">Chưa phát triển</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">LIÊN HỆ</a></li>
                            </ul>
                        </nav>
                    </div><!-- Main Menu End -->
                </div>
                <div class="col order-2 order-lg-12 order-xl-12">
                    <!-- Header Shop Links Start -->
                    <div class="header-shop-links">
                        <!-- Compare -->
                        <%--<a href="compare.html" class="header-compare"><i class="ti-control-shuffle"></i></a>--%>
                        <!-- Wishlist -->
                        <a href="#" class="header-wishlist"><i class="ti-heart"></i> <span
                                class="number">0</span></a>
                        <!-- Cart -->
                        <c:if test="${quantityProduct == 0}">
                            <a href="${pageContext.request.contextPath}/giohang" class="header-cart"><i class="ti-shopping-cart"></i> <span
                                    class="number">0</span></a>
                        </c:if>
                        <c:if test="${quantityProduct > 0}">
                            <a href="${pageContext.request.contextPath}/giohang" class="header-cart"><i class="ti-shopping-cart"></i> <span
                                    class="number">${quantityProduct}</span></a>
                        </c:if>
                    </div><!-- Header Shop Links End -->
                </div>
                <!-- Mobile Menu -->
                <div class="mobile-menu order-12 d-block d-lg-none col"></div>
            </div>
        </div>
    </div><!-- Header Bottom End -->
    <!-- Header Section End -->
    <!-- Cart Overlay -->
    <div class="cart-overlay"></div>
    <!-- Hero Section Start -->