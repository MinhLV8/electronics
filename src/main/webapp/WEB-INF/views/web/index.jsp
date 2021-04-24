<%@ page pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/web/header.jsp" %>
<%@ include file="/includes/web/menu.jsp" %>
<div class="product-section section mb-70">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="FEATURED ITEMS"><h1>SẢN PHẨM NỔI BẬT</h1></div>
            </div><!-- Section Title End -->
            <!-- Product Tab Filter Start -->
            <div class="col-12 mb-30">
                <div class="product-tab-filter">
                    <!-- Tab Filter Toggle -->
                    <button class="product-tab-filter-toggle">showing: <span></span><i
                            class="icofont icofont-simple-down"></i></button>
                    <!-- Product Tab List -->
                    <ul class="nav product-tab-list">
                        <li><a class="active" data-toggle="tab" href="#tab-one">Tất cả</a></li>
                        <c:forEach var="category" items="${categoryName}">
                            <li><a data-toggle="tab" href="#tab-two">${category.name}</a></li>
                        </c:forEach>
                        <%--<li><a data-toggle="tab" href="#tab-two">LAPTOP</a></li>
                        <li><a data-toggle="tab" href="#tab-one">Pc</a></li>
                        <li><a data-toggle="tab" href="#tab-two">Điện thoại</a></li>
                        <li><a data-toggle="tab" href="#tab-one">Tablet</a></li>
                        <li><a data-toggle="tab" href="#tab-two">CAMERA & PRINTER</a></li>--%>
                    </ul>
                </div>
            </div><!-- Product Tab Filter End -->
            <!-- Product Tab Content Start -->
            <div class="col-12">
                <div class="tab-content">
                    <!-- Tab Pane Start -->
                    <div class="tab-pane fade show active" id="tab-one">
                        <!-- Product Slider Wrap Start -->
                        <div class="product-slider-wrap product-slider-arrow-one">
                            <!-- Product Slider Start -->
                            <div class="product-slider product-slider-4">
                                <c:forEach var="productList" items="${productList}">
                                    <div class="col pb-20 pt-10">
                                        <!-- Product Start -->
                                        <div class="ee-product">
                                            <!-- Image -->
                                            <div class="image">
                                                <span class="label sale badge badge-warning">Trả góp 0%</span>
                                                <a href="/chitietsanpham/${productList.id}" class="img"><img
                                                        src="/getImage/${productList.imageList.get(0).url}"
                                                        alt="Product Image"></a>
                                                <div class="wishlist-compare">
                                                    <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                                </div>
                                                <a href="/cartItem-product/${productList.id}" class="add-to-cart"><i class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                            </div>
                                            <!-- Content -->
                                            <div class="content">
                                                <!-- Category & Title -->
                                                <div class="category-title">
                                                    <a href="#" class="cat"><span class="badge badge-info">${productList.category.name}</span></a>
                                                    <h5 class="title">
                                                        <a href="/chitietsanpham/${productList.id}">${productList.name}</a>
                                                    </h5>
                                                </div>
                                                <!-- Price & Ratting -->
                                                <div class="price-ratting">
                                                    <c:if test="${promotionService.getPromotion(productList.id) == null}">
                                                        <h5 class="price">
                                                            <fmt:formatNumber type="number" groupingUsed="true" value="${productList.price}"/>₫</h5>
                                                    </c:if>
                                                    <c:if test="${promotionService.getPromotion(productList.id) != null}">
                                                        <c:if test="${promotionService.getPromotion(productList.id).decrease.equals('Giảm theo %')}">
                                                            <h5 class="price"><span class="old"> <fmt:formatNumber type="number" groupingUsed="true" value="${productList.price}"/>
                                                        ₫</span><fmt:formatNumber type="number" groupingUsed="true" value="${productList.money_Deals(promotionService.getPromotion(productList.id).moneyDeals)}"/>
                                                                ₫</h5>
                                                        </c:if>
                                                        <c:if test="${promotionService.getPromotion(productList.id).decrease.equals('Giảm theo giá')}">
                                                            <h5 class="price"><span class="old"><fmt:formatNumber type="number" groupingUsed="true" value="${productList.price}"/>
                                                        ₫</span><fmt:formatNumber type="number" groupingUsed="true" value="${productList.money_price(promotionService.getPromotion(productList.id).moneyDeals)}"/>
                                                                ₫</h5>
                                                        </c:if>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div><!-- Product End -->
                                    </div>
                                </c:forEach>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <span class="label sale">sale</span>
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Drone</a>
                                                <h5 class="title"><a href="single-product.html">Aquet Drone D 420</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price"><span class="old">$350</span>$275.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Games</a>
                                                <h5 class="title"><a href="single-product.html">Game Station X 22</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$295.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Accessories</a>
                                                <h5 class="title"><a href="single-product.html">Roxxe Headphone Z 75</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$110.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Camera</a>
                                                <h5 class="title"><a href="single-product.html">Mony Handycam Z 105</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$110.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                            </div><!-- Product Slider End -->
                        </div><!-- Product Slider Wrap End -->
                    </div><!-- Tab Pane End -->
                    <!-- Tab Pane Start -->
                    <div class="tab-pane fade" id="tab-two">
                        <!-- Product Slider Wrap Start -->
                        <div class="product-slider-wrap product-slider-arrow-one">
                            <!-- Product Slider Start -->
                            <div class="product-slider product-slider-4">
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <span class="label sale">sale</span>
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Camera</a>
                                                <h5 class="title"><a href="single-product.html">Axor Digital camera</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price"><span class="old">$265</span>$199.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Camera</a>
                                                <h5 class="title"><a href="single-product.html">Silvex DSLR Camera T
                                                    32</a></h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$580.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <span class="label new">new</span>
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>
                                            <%-- <a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Camera</a>
                                                <h5 class="title"><a href="single-product.html">Necta Instant Camera</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$320.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <span class="label sale">sale</span>
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Watch</a>
                                                <h5 class="title"><a href="single-product.html">Mascut Smart Watch</a>
                                                </h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price"><span class="old">$365</span>$295.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                                <div class="col pb-20 pt-10">
                                    <!-- Product Start -->
                                    <div class="ee-product">
                                        <!-- Image -->
                                        <div class="image">
                                            <a href="single-product.html" class="img"><img
                                                    src="/web/assets/images/product/product-1.png" alt="Product Image"></a>
                                            <div class="wishlist-compare">
                                                <a href="#" data-tooltip="Compare"><i
                                                        class="ti-control-shuffle"></i></a>
                                                <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                            </div>
                                            <%--<a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                        </div>
                                        <!-- Content -->
                                        <div class="content">
                                            <!-- Category & Title -->
                                            <div class="category-title">
                                                <a href="#" class="cat">Watch</a>
                                                <h5 class="title"><a href="single-product.html">Z Bluetooth
                                                    Headphone</a></h5>
                                            </div>
                                            <!-- Price & Ratting -->
                                            <div class="price-ratting">
                                                <h5 class="price">$189.00</h5>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- Product End -->
                                </div>
                            </div><!-- Product Slider End -->
                        </div><!-- Product Slider Wrap End -->
                    </div><!-- Tab Pane End -->
                </div>
            </div><!-- Product Tab Content End -->
        </div>
    </div>
</div>
<!-- Feature Product Section End -->
<!-- Best Sell Product Section Start -->
<div class="product-section section mb-60">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="BEST SELLER"><h1>BÁN CHẠY NHẤT</h1></div>
            </div><!-- Section Title End -->
            <div class="col-12">
                <c:if test="${sellingProducts.size() == 0}">
                    <div class="alert alert-warning" role="alert">
                        Không có sản phẩm nào!
                    </div>
                </c:if>
                <div class="row">
                    <c:forEach var="product" items="${sellingProducts}">
                        <div class="col-xl-3 col-lg-4 col-md-6 col-12 pb-30 pt-10">
                            <!-- Product Start -->
                            <div class="ee-product">
                                <!-- Image -->
                                <div class="image">
                                    <%--<span class="label sale">Bán chạy</span>--%>
                                    <span class="label sale badge badge-warning">Hot</span>
                                    <a href="/chitietsanpham/${product.id}" class="img"><img src="/getImage/${product.imageList.get(0).url}"
                                                                                            alt="Product Image"></a>
                                    <div class="wishlist-compare">
                                        <a href="#" data-tooltip="Compare"><i class="ti-control-shuffle"></i></a>
                                        <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                    </div>
                                    <a href="/cartItem-product/${product.id}" class="add-to-cart"><i class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                </div>
                                <!-- Content -->
                                <div class="content">
                                    <!-- Category & Title -->
                                    <div class="category-title">
                                        <a href="#" class="cat text-secondary font-weight-bold"><span class="badge badge-info">${product.category.name}</span></a>
                                        <h5 class="title"><a href="/chitietsanpham/${product.id}">${product.name}</a>
                                        </h5>
                                    </div>
                                    <!-- Price & Ratting -->
                                    <div class="price-ratting">
                                        <c:if test="${promotionService.getPromotion(product.id) == null}">
                                            <h5 class="price">
                                                <fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>₫</h5></p></a>
                                            <p>&nbsp;</p>
                                        </c:if>
                                        <c:if test="${promotionService.getPromotion(product.id) != null}">
                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo %')}">
                                                <h5 class="price"><span class="old"> <fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                        ₫</span><fmt:formatNumber type="number" groupingUsed="true" value="${product.money_Deals(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:if>
                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo giá')}">
                                                <h5 class="price"><span class="old"><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                        ₫</span><fmt:formatNumber type="number" groupingUsed="true" value="${product.money_price(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫</h5>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div><!-- Product End -->
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Best Sell Product Section End -->
<!-- Banner Section Start -->
<div class="banner-section section mb-90">
    <div class="container">
        <div class="row">
            <!-- Banner -->
            <div class="col-12">
                <div class="banner"><a href="#"><img src="/web/assets/banner-03.png" alt="Banner"></a></div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->
<!-- Feature Section Start -->
<div class="feature-section section mb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-12 mb-30">
                <!-- Feature Start -->
                <div class="feature feature-shipping">
                    <div class="feature-wrap">
                        <div class="icon"><img src="/web/assets/images/icons/feature-van.png" alt="Feature"></div>
                        <h4>MIỄN PHÍ VẬN CHUYỂN</h4>
                        <p>Cho đơn hàng trên 1.000.000</p>
                    </div>
                </div><!-- Feature End -->
            </div>
            <div class="col-lg-4 col-md-6 col-12 mb-30">
                <!-- Feature Start -->
                <div class="feature feature-guarantee">
                    <div class="feature-wrap">
                        <div class="icon"><img src="/web/assets/images/icons/feature-walet.png" alt="Feature"></div>
                        <h4>ĐẢM BẢO HOÀN TIỀN</h4>
                        <p>Hoàn tiền trong vòng 15 ngày</p>
                    </div>
                </div><!-- Feature End -->
            </div>
            <div class="col-lg-4 col-md-6 col-12 mb-30">
                <!-- Feature Start -->
                <div class="feature feature-security">
                    <div class="feature-wrap">
                        <div class="icon"><img src="/web/assets/images/icons/feature-shield.png" alt="Feature"></div>
                        <h4>THANH TOÁN AN TOÀN</h4>
                        <p>Bảo mật thanh toán</p>
                    </div>
                </div><!-- Feature End -->
            </div>
        </div>
    </div>
</div>
<!-- Feature Section End -->
<!-- Best Deals Product Section Start -->
<div class="product-section section mb-40">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="BEST DEALS"><h1>ĐANG KHUYếN MÃI</h1></div>
            </div><!-- Section Title End -->
            <!-- Product Tab Filter Start-->
            <div class="col-12">
                <div class="offer-product-wrap row">
                    <!-- Product Tab Filter Start -->
                    <div class="col mb-30">
                        <div class="product-tab-filter">
                            <!-- Tab Filter Toggle -->
                            <button class="product-tab-filter-toggle">showing: <span></span><i
                                    class="icofont icofont-simple-down"></i></button>
                            <!-- Product Tab List -->
                            <%--<ul class="nav product-tab-list">
                                <li><a class="active" data-toggle="tab" href="#tab-three">all</a></li>
                                <li><a data-toggle="tab" href="#tab-four">LAPTOP</a></li>
                                <li><a data-toggle="tab" href="#tab-three">DRONE</a></li>
                                <li><a data-toggle="tab" href="#tab-four">TV & AUDIO</a></li>
                                <li><a data-toggle="tab" href="#tab-three">PHONE & TABLET</a></li>
                                <li><a data-toggle="tab" href="#tab-four">CAMERA & PRINTER</a></li>
                            </ul>--%>
                        </div>
                    </div><!-- Product Tab Filter End -->
                    <!-- Offer Time Wrap Start -->
                    <div class="col mb-30">
                        <div class="offer-time-wrap"
                             style="background-image: url(/web/assets/images/bg/offer-products.jpg)">
                            <h1><span>LÊN ĐẾN</span> 55%</h1>
                            <h3>CHẤT LƯỢNG & ĐỘC QUYỀN <span>SẢN PHẨM</span></h3>
                            <h4><span>THỜI GIAN CÓ HẠN</span> TẶNG SẢN PHẨM</h4>
                            <div class="countdown" data-countdown="2021/01/30"></div>
                        </div>
                    </div><!-- Offer Time Wrap End -->
                    <!-- Product Tab Content Start -->
                    <div class="col-12 mb-30">
                        <div class="tab-content">
                            <!-- Tab Pane Start -->
                            <div class="tab-pane fade show active" id="tab-three">
                                <!-- Product Slider Wrap Start -->
                                <div class="product-slider-wrap product-slider-arrow-two">
                                    <!-- Product Slider Start -->
                                    <div class="product-slider product-slider-3">
                                        <c:if test="${promotionList.size() == 0}">
                                            <h4 style="text-align: center">Không có sản phẩm nào hết...!</h4>
                                        </c:if>
                                        <c:forEach var="product" items="${promotionList}">
                                            <div class="col pb-20 pt-10">
                                                <!-- Product Start -->
                                                <div class="ee-product">
                                                    <!-- Image -->
                                                    <div class="image">
                                                        <span class="label new badge badge-warning">Khuyến mãi ${promotionService.getPromotion(product.id).title}</span>
                                                        <a href="/chitietsanpham/${product.id}" class="img"><img
                                                                src="/getImage/${product.imageList.get(0).url}"
                                                                alt="Product Image"></a>
                                                        <div class="wishlist-compare">
                                                            <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                                        </div>
                                                        <a href="/cartItem-product/${product.id}" class="add-to-cart"><i class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                                    </div>
                                                    <!-- Content -->
                                                    <div class="content">
                                                        <!-- Category & Title -->
                                                        <div class="category-title">
                                                            <a href="#" class="cat text-danger font-weight-bold"><span class="badge badge-info">${product.category.name}</span></a>
                                                            <h5 class="title">
                                                                <a href="/chitietsanpham/${product.id}">${product.name}</a>
                                                            </h5>
                                                        </div>
                                                        <!-- Price & Ratting -->
                                                        <div class="price-ratting">
                                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo %')}">
                                                                <h5 class="price">
                                                                    <span class="old">
                                                                        <fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/> ₫
                                                                    </span>
                                                                    <fmt:formatNumber type="number" groupingUsed="true" value="${product.money_Deals(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                                    ₫
                                                                    <h6 class="text-danger">
                                                                        <span>-${promotionService.getPromotion(product.id).formatDiscount()}%</span>
                                                                    </h6>
                                                                </h5>
                                                            </c:if>
                                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo giá')}">
                                                                <h5 class="price"><span class="old"><fmt:formatNumber type="number" groupingUsed="true" value="${product.money_price(promotionService.getPromotion(product.id).moneyDeals)}"/> ₫</p></a>
                                                                </span><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                                    ₫</h5>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div><!-- Product End -->
                                            </div>
                                        </c:forEach>
                                    </div><!-- Product Slider End -->
                                </div><!-- Product Slider Wrap End -->
                            </div><!-- Tab Pane End -->
                            <!-- Tab Pane Start -->
                            <div class="tab-pane fade" id="tab-four">
                                <!-- Product Slider Wrap Start -->
                                <div class="product-slider-wrap product-slider-arrow-two">
                                    <!-- Product Slider Start -->
                                    <div class="product-slider product-slider-3">
                                        <div class="col pb-20 pt-10">
                                            <!-- Product Start -->
                                            <div class="ee-product">
                                                <!-- Image -->
                                                <div class="image">
                                                    <a href="single-product.html" class="img"><img
                                                            src="/web/assets/images/product/product-1.png"
                                                            alt="Product Image"></a>
                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i
                                                                class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>
                                                    <%--<a href="#" class="add-to-cart"><i
                                                            class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                                </div>
                                                <!-- Content -->
                                                <div class="content">
                                                    <!-- Category & Title -->
                                                    <div class="category-title">
                                                        <a href="#" class="cat">Tv & Audio</a>
                                                        <h5 class="title"><a href="single-product.html">Xonet Speaker P
                                                            9</a></h5>
                                                    </div>
                                                    <!-- Price & Ratting -->
                                                    <div class="price-ratting">
                                                        <h5 class="price">$185.00</h5>
                                                        <div class="ratting">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- Product End -->
                                        </div>
                                        <div class="col pb-20 pt-10">
                                            <!-- Product Start -->
                                            <div class="ee-product">
                                                <!-- Image -->
                                                <div class="image">
                                                    <a href="single-product.html" class="img"><img
                                                            src="/web/assets/images/product/product-1.png"
                                                            alt="Product Image"></a>
                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i
                                                                class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>
                                                    <%--<a href="#" class="add-to-cart"><i
                                                            class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                                </div>
                                                <!-- Content -->
                                                <div class="content">
                                                    <!-- Category & Title -->
                                                    <div class="category-title">
                                                        <a href="#" class="cat">Smartphone</a>
                                                        <h5 class="title"><a href="single-product.html">Sany Experia
                                                            Z5</a></h5>
                                                    </div>
                                                    <!-- Price & Ratting -->
                                                    <div class="price-ratting">
                                                        <h5 class="price">$360.00</h5>
                                                        <div class="ratting">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- Product End -->
                                        </div>
                                        <div class="col pb-20 pt-10">
                                            <!-- Product Start -->
                                            <div class="ee-product">
                                                <!-- Image -->
                                                <div class="image">
                                                    <a href="single-product.html" class="img"><img
                                                            src="/web/assets/images/product/product-1.png"
                                                            alt="Product Image"></a>
                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i
                                                                class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>
                                                    <%-- <a href="#" class="add-to-cart"><i
                                                             class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                                </div>
                                                <!-- Content -->
                                                <div class="content">
                                                    <!-- Category & Title -->
                                                    <div class="category-title">
                                                        <a href="#" class="cat">Kitchen Appliances</a>
                                                        <h5 class="title"><a href="single-product.html">Jackson Toster V
                                                            27</a></h5>
                                                    </div>
                                                    <!-- Price & Ratting -->
                                                    <div class="price-ratting">
                                                        <h5 class="price"><span class="old">$185</span>$135.00</h5>
                                                        <div class="ratting">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- Product End -->
                                        </div>
                                        <div class="col pb-20 pt-10">
                                            <!-- Product Start -->
                                            <div class="ee-product">
                                                <!-- Image -->
                                                <div class="image">
                                                    <a href="single-product.html" class="img"><img
                                                            src="/web/assets/images/product/product-1.png"
                                                            alt="Product Image"></a>
                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i
                                                                class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>
                                                    <%-- <a href="#" class="add-to-cart"><i
                                                             class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                                </div>
                                                <!-- Content -->
                                                <div class="content">
                                                    <!-- Category & Title -->
                                                    <div class="category-title">
                                                        <a href="#" class="cat">Kitchen Appliances</a>
                                                        <h5 class="title"><a href="single-product.html">mega Juice
                                                            Maker</a></h5>
                                                    </div>
                                                    <!-- Price & Ratting -->
                                                    <div class="price-ratting">
                                                        <h5 class="price">$125.00</h5>
                                                        <div class="ratting">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- Product End -->
                                        </div>
                                        <div class="col pb-20 pt-10">
                                            <!-- Product Start -->
                                            <div class="ee-product">
                                                <!-- Image -->
                                                <div class="image">
                                                    <span class="label new">new</span>
                                                    <a href="single-product.html" class="img"><img
                                                            src="/web/assets/images/product/product-1.png"
                                                            alt="Product Image"></a>
                                                    <div class="wishlist-compare">
                                                        <a href="#" data-tooltip="Compare"><i
                                                                class="ti-control-shuffle"></i></a>
                                                        <a href="#" data-tooltip="Wishlist"><i class="ti-heart"></i></a>
                                                    </div>
                                                    <%--<a href="#" class="add-to-cart"><i
                                                            class="ti-shopping-cart"></i><span>ADD TO CART</span></a>--%>
                                                </div>
                                                <!-- Content -->
                                                <div class="content">
                                                    <!-- Category & Title -->
                                                    <div class="category-title">
                                                        <a href="#" class="cat">Kitchen Appliances</a>
                                                        <h5 class="title"><a href="single-product.html">shine Microwave
                                                            Oven</a></h5>
                                                    </div>
                                                    <!-- Price & Ratting -->
                                                    <div class="price-ratting">
                                                        <h5 class="price"><span class="old">$389</span>$245.00</h5>
                                                        <div class="ratting">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- Product End -->
                                        </div>
                                    </div><!-- Product Slider End -->
                                </div><!-- Product Slider Wrap End -->
                            </div><!-- Tab Pane End -->
                        </div>
                    </div><!-- Product Tab Content End -->
                </div>
            </div><!-- Product Tab Filter End-->
        </div>
    </div>
</div>
<!-- Best Deals Product Section End -->
<!-- New Arrival Product Section Start -->
<div class="product-section section mb-60">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="NEW ARRIVAL"><h1>HÀNG MỚI VỀ</h1></div>
            </div><!-- Section Title End -->
            <div class="col-12">
                <div class="row">
                    <c:forEach var="product" items="${recentProducts}">
                        <div class="col-xl-3 col-lg-4 col-md-6 col-12 pb-30 pt-10">
                            <!-- Product Start -->
                            <div class="ee-product">
                                <!-- Image -->
                                <div class="image">
                                    <span class="label new badge badge-warning">New</span>
                                    <a href="/chitietsanpham/${product.id}" class="img"><img
                                            src="/getImage/${product.imageList.get(0).url}" alt="Product Image"></a>
                                    <div class="wishlist-compare">
                                        <a href="#" data-tooltip="Wishlist"><i class="fa fa-heart"></i></a>
                                    </div>
                                    <a href="/cartItem-product/${product.id}" class="add-to-cart"><i class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                </div>
                                <!-- Content -->
                                <div class="content">
                                    <!-- Category & Title -->
                                    <div class="category-title">
                                        <a href="#" class="cat"><span class="badge badge-info">${product.category.name}</span></a>
                                        <h5 class="title"><a href="/chitietsanpham/${product.id}">${product.name}</a>
                                        </h5>
                                    </div>
                                    <!-- Price & Ratting -->
                                    <div class="price-ratting">
                                        <c:if test="${promotionService.getPromotion(product.id) == null}">
                                            <h5 class="price">
                                                <fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                ₫</h5>
                                        </c:if>
                                        <c:if test="${promotionService.getPromotion(product.id) != null}">
                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo %')}">
                                                <h5 class="price">
                                                    <span class="old"><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                        ₫</span>
                                                    <fmt:formatNumber type="number" groupingUsed="true" value="${product.money_Deals(promotionService.getPromotion(product.id).moneyDeals)}"/>₫
                                                </h5>
                                            </c:if>
                                            <c:if test="${promotionService.getPromotion(product.id).decrease.equals('Giảm theo giá')}">
                                                <h5 class="price">
                                                    <span class="old"><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}"/>
                                                    ₫</span>
                                                    <fmt:formatNumber type="number" groupingUsed="true" value="${product.money_price(promotionService.getPromotion(product.id).moneyDeals)}"/>
                                                    ₫
                                                </h5>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div><!-- Product End -->
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- New Arrival Product Section End -->
<%@ include file="/includes/web/footer.jsp" %>
