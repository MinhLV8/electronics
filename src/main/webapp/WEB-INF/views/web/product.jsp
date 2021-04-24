<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 30/12/2020
  Time: 11:32 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Sản Phẩm</title>
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
                <h1>Sản phẩm</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Sản Phẩm</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End -->
<!-- Product Section Start -->
<div class="product-section section mt-90 mb-40">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 col-lg-8 col-12 order-lg-2 mb-50">
                <div class="row mb-50">
                    <div class="col">
                        <!-- Shop Top Bar Start -->
                        <div class="shop-top-bar with-sidebar">
                            <div class="product-view-mode">
                                <a class="active" href="#" data-target="grid"><i class="fa fa-th"></i></a>
                                <a href="#" data-target="list"><i class="fa fa-list"></i></a>
                            </div>
                            <!-- Product Short -->
                            <%--<div class="product-short">
                                <p>Short by</p>
                                <select name="sortby" class="nice-select">
                                    <option value="trending">Trending items</option>
                                    <option value="sales">Best sellers</option>
                                    <option value="rating">Best rated</option>
                                    <option value="date">Newest items</option>
                                    <option value="price-asc">Price: low to high</option>
                                    <option value="price-desc">Price: high to low</option>
                                </select>
                            </div>--%>
                            <!-- Product Pages -->
                            <%--<div class="product-pages">
                                <p>Pages 1 of 25</p>
                            </div>--%>
                        </div><!-- Shop Top Bar End -->
                    </div>
                </div>
                <!-- Shop Product Wrap Start -->
                <!-- Shop Product Wrap Start -->
                <c:if test="${empty productList.pageList}">
                    <div class="alert alert-warning" role="alert">
                        Không có sản phẩm nào!
                    </div>
                </c:if>
                <div class="shop-product-wrap grid with-sidebar row">
                    <c:forEach var="product" items="${productList.pageList}">
                        <div class="col-xl-4 col-md-6 col-12 pb-30 pt-10">
                            <!-- Product Start -->
                            <div class="ee-product">
                                <!-- Image -->
                                <div class="image">
                                    <a href="/chitietsanpham/${product.id}" class="img"><img
                                            src="/getImage/${imageService.urlImage(product.id).url}"
                                            alt="Product Image"></a>
                                    <div class="wishlist-compare">
                                        <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                    </div>
                                    <a href="/cartItem-product/${product.id}" class="add-to-cart"><i
                                            class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                </div>
                                <!-- Content -->
                                <div class="content">
                                    <!-- Category & Title -->
                                    <div class="category-title">
                                        <a href="#" class="cat"><span
                                                class="badge badge-pill badge-info">${product.category.name}</span></a>
                                        <h5 class="title"><a href="/chitietsanpham/${product.id}">${product.name}</a>
                                        </h5>
                                    </div>
                                    <!-- Price & Ratting -->
                                    <div class="price-ratting">
                                        <c:choose>
                                            <c:when test="${promotionService.getPromotion(product.id) == null}">
                                                <h5 class="price">
                                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                                      value="${product.price}"/>₫</h5>
                                            </c:when>
                                            <c:when test="${promotionService.getPromotion(product.id) != null && promotionService.getPromotion(product.id).decrease.equals('Giảm theo %')}">
                                                <h5 class="price"><span class="old"> <fmt:formatNumber type="number"
                                                                                                       groupingUsed="true"
                                                                                                       value="${product.price}"/>
                                                                    ₫</span><fmt:formatNumber type="number"
                                                                                              groupingUsed="true"
                                                                                              value="${product.money_Deals(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:when>
                                            <c:when test="${promotionService.getPromotion(product.id) != null && promotionService.getPromotion(product.id).decrease.equals('Giảm theo giá')}">
                                                <h5 class="price"><span class="old"><fmt:formatNumber type="number"
                                                                                                      groupingUsed="true"
                                                                                                      value="${product.price}"/>
                                                                    ₫</span><fmt:formatNumber type="number"
                                                                                              groupingUsed="true"
                                                                                              value="${product.money_price(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:when>
                                        </c:choose>
                                            <%--<div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>--%>
                                    </div>
                                </div>
                            </div><!-- Product End -->
                            <!-- Product List Start -->
                            <div class="ee-product-list">
                                <!-- Image -->
                                <div class="image">
                                    <a href="/chitietsanpham/${product.id}" class="img"><img
                                            src="/getImage/${imageService.urlImage(product.id).url}"
                                            alt="Product Image"></a>
                                </div>
                                <!-- Content -->
                                <div class="content">
                                    <!-- Category & Title -->
                                    <div class="head-content">
                                        <div class="category-title">
                                            <a href="#" class="cat">${product.category.name}</a>
                                            <h5 class="title"><a href="/chitietsanpham/${product.id}">${product.name}</a>
                                            </h5>
                                        </div>
                                        <c:choose>
                                            <c:when test="${promotionService.getPromotion(product.id) == null}">
                                                <h5 class="price text-danger">
                                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                                      value="${product.price}"/>₫</h5>
                                            </c:when>
                                            <c:when test="${promotionService.getPromotion(product.id) != null && promotionService.getPromotion(product.id).decrease.equals('Giảm theo %')}">
                                                <h5 class="price text-danger"><span class="old"> <fmt:formatNumber
                                                        type="number" groupingUsed="true" value="${product.price}"/>
                                                                    ₫</span><fmt:formatNumber type="number"
                                                                                              groupingUsed="true"
                                                                                              value="${product.money_Deals(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:when>
                                            <c:when test="${promotionService.getPromotion(product.id) != null && promotionService.getPromotion(product.id).decrease.equals('Giảm theo giá')}">
                                                <h5 class="price text-danger"><span class="old"><fmt:formatNumber
                                                        type="number" groupingUsed="true" value="${product.price}"/>
                                                                    ₫</span><fmt:formatNumber type="number"
                                                                                              groupingUsed="true"
                                                                                              value="${product.money_price(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <div class="left-content">
                                        <div class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        <div class="desc">
                                            <p><span class="badge badge-warning">KHUYẾN MÃI</span>
                                            <ul>
                                                <li><i class="fa fa-check-circle"></i> Mua kèm Microsoft 365 Personal 1
                                                    năm chỉ còn 690,000đ Xem chi tiết
                                                </li>
                                                <li><i class="fa fa-check-circle"></i> Pin sạc dự phòng giảm 30% khi mua
                                                    kèm. (click xem chi tiết)
                                                </li>
                                                <li><i class="fa fa-check-circle"></i> Mua Đồng hồ thời trang giảm 40%
                                                    (không kèm KM khác)
                                                </li>
                                            </ul>
                                            </p>
                                        </div>
                                        <div class="actions">
                                            <a href="/cartItem-product/${product.id}" class="add-to-cart"><i
                                                    class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="specification">
                                            <h5>Thông tin chung</h5>
                                            <ul>
                                                <li><strong>CPU: </strong>${product.productInformation.cpu}</li>
                                                <li><strong>VGA: </strong>${product.productInformation.gpu}</li>
                                                <li><strong>Ram: </strong>${product.productInformation.ram}</li>
                                                <li><strong>Màn hình: </strong>${product.productInformation.display}
                                                </li>
                                                <li><strong>Ổ cứng: </strong>${product.productInformation.memory}</li>
                                                <li><strong>OS: </strong>${product.productInformation.oS}</li>
                                                <li><strong>Thời điểm ra
                                                    mắt: </strong>${product.productInformation.timeOfLaunch}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- Product List End -->
                        </div>
                    </c:forEach>
                </div><!-- Shop Product Wrap End -->
                <div class="row mt-30">
                    <div class="col">
                        <ul class="pagination">
                            <li class="${currentIndex == 1 ? 'disabled': ''} ">
                                <a href="${baseUrl}${currentIndex - 1}"
                                   aria-disabled="true"><i class="fa fa-angle-left"></i>Back</a>
                            </li>
                            <c:if test="${totalPageCount <= 10}">
                                <c:forEach var="item" begin="${1}" end="${totalPageCount}">
                                    <li class="${item == currentIndex ? 'active': ''}">
                                        <a href="${baseUrl}${item}">${item}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${totalPageCount > 10}">
                                <c:if test="${currentIndex <= 3 or currentIndex > totalPageCount-2}">
                                    <c:forEach var="item" begin="${1}" end="${3}">
                                        <li class="${item == currentIndex ? 'active': ''}">
                                            <a href="${baseUrl}${item}">${item}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="${item == currentIndex ? 'active': ''}">
                                        <a href="${baseUrl}${4}">---</a>
                                    </li>
                                    <c:forEach var="item" begin="${totalPageCount-2}" end="${totalPageCount}">
                                        <li class="${item == currentIndex ? 'active': ''}">
                                            <a href="${baseUrl}${item}">${item}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${currentIndex > 3 and currentIndex <= totalPageCount-2}">
                                    <li class="${item == currentIndex ? 'active': ''}">
                                        <a href="${baseUrl}${currentIndex - 3}">---</a>
                                    </li>
                                    <c:forEach var="item" begin="${currentIndex-2}" end="${currentIndex + 2}">
                                        <li class="${item == currentIndex ? 'active': ''}">
                                            <a href="${baseUrl}${item}">${item}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="${item == currentIndex ? 'active': ''}">
                                        <a href="${baseUrl}${currentIndex + 3}">---</a>
                                    </li>
                                </c:if>
                            </c:if>
                            <li class="${currentIndex == totalPageCount ? 'disabled': ''}">
                                <a href="${baseUrl}${currentIndex + 1}">Next<i class="fa fa-angle-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="shop-sidebar-wrap col-xl-3 col-lg-4 col-12 order-lg-1 mb-15">
                <div class="shop-sidebar mb-35">
                    <h4 class="title">Loại sản phẩm</h4>
                    <ul class="sidebar-category">
                        <c:forEach var="category" items="${categoryList}">
                            <li><a href="/${category.name}/page/1/">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="shop-sidebar mb-35">
                    <h4 class="title">Thương hiệu</h4>
                    <ul class="sidebar-brand">
                        <c:forEach var="brand" items="${brandList}">
                            <li><a href="/thuonghieu/${brand.name}/page/1/">${brand.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="shop-sidebar mb-35">
                    <h4 class="title">Giá</h4>
                    <div class="sidebar-price">
                        <div id="price-range"
                             class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
                            <div class="ui-slider-range ui-widget-header ui-corner-all"
                                 style="left: 1.25%; width: 47.25%;"></div>
                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"
                                  style="left: 1.25%;"></span><span
                                class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"
                                style="left: 48.5%;"></span>
                        </div>
                        <input type="text" id="price-amount" readonly="">
                    </div>
                </div>
                <div class="shop-sidebar mb-35">
                    <div class="banner"><a href="#"><img
                            src="${pageContext.request.contextPath}/web/assets/images/banner/banner-41.png"
                            alt="Banner"></a>
                    </div>
                </div>
                <div class="shop-sidebar mb-35">
                    <h4 class="title">Tags</h4>
                    <div class="sidebar-tags">
                        <a href="#">smartphone</a>
                        <a href="#">Iron</a>
                        <a href="#">Trimer</a>
                        <a href="#">Smart Watch</a>
                        <a href="#">Play Station</a>
                        <a href="#">Oven</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Feature Product Section End -->
<%@ include file="/includes/web/footer.jsp" %>
</body>
</html>
