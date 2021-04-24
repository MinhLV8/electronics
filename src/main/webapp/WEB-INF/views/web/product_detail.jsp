<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>${productID.name}</title>
</head>
<body>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/web/header.jsp" %>
<c:if test="${not empty mes}">
    <script type="text/javascript">
        Swal.fire({
            icon: 'error',
            title: 'Lỗi !!!',
            text: '${mes}'
        })
    </script>
</c:if>
<!-- Single Product Section Start -->
<div class="product-section section mt-90 mb-90">
    <div class="container">
        <div class="row mb-90">
            <div class="col-lg-6 col-12 mb-50">
                <!-- Image -->
                <div class="single-product-image thumb-right">
                    <div class="tab-content">
                        <div id="single-image-1" class="tab-pane fade show active big-image-slider">
                            <c:forEach var="image" items="${imageList}">
                                <div class="big-image">
                                    <img src="/getImage/${image.url}" alt="Big Image"><a
                                        href="/getImage/${image.url}" class="big-image-popup"><i
                                        class="fa fa-search-plus"></i></a>
                                </div>
                            </c:forEach>
                            <%--<div class="big-image">
                                <img src="/getImage/${productID.imageList.get(0).url}" alt="Big Image"><a
                                    href="/getImage/${productID.imageList.get(0).url}" class="big-image-popup"><i
                                    class="fa fa-search-plus"></i></a>
                            </div>--%>
                            <%--<div class="big-image">
                                <img src="assets/images/single-product/big-2.png" alt="Big Image"><a
                                    href="assets/images/single-product/big-2.png" class="big-image-popup"><i
                                    class="fa fa-search-plus"></i></a>
                            </div>
                            <div class="big-image">
                                <img src="assets/images/single-product/big-3.png" alt="Big Image"><a
                                    href="assets/images/single-product/big-3.png" class="big-image-popup"><i
                                    class="fa fa-search-plus"></i></a>
                            </div>--%>
                        </div>
                        <%--<div id="single-image-2" class="tab-pane fade big-image-slider">
                            <div class="big-image">
                                <img src="assets/images/single-product/big-7.png" alt="Big Image"><a href="assets/images/single-product/big-7.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                            <div class="big-image">
                                <img src="assets/images/single-product/big-8.png" alt="Big Image"><a href="assets/images/single-product/big-9.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                            <div class="big-image">
                                <img src="assets/images/single-product/big-9.png" alt="Big Image"><a href="assets/images/single-product/big-9.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                        </div>
                        <div id="single-image-3" class="tab-pane fade big-image-slider">
                            <div class="big-image">
                                <img src="assets/images/single-product/big-13.png" alt="Big Image"><a href="assets/images/single-product/big-13.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                            <div class="big-image">
                                <img src="assets/images/single-product/big-14.png" alt="Big Image"><a href="assets/images/single-product/big-14.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                            <div class="big-image">
                                <img src="assets/images/single-product/big-15.png" alt="Big Image"><a href="assets/images/single-product/big-15.png" class="big-image-popup"><i class="fa fa-search-plus"></i></a>
                            </div>
                        </div>--%>
                    </div>
                    <div class="thumb-image-slider nav" data-vertical="true">
                        <c:forEach var="image" items="${imageList}">
                            <a class="thumb-image active" data-toggle="tab" href="/getImage/${image.url}"><img
                                    src="/getImage/${image.url}" alt="Thumbnail Image"></a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-12 mb-50">
                <!-- Content -->
                <div class="single-product-content">
                    <!-- Category & Title -->
                    <div class="head-content">
                        <div class="category-title">
                            <a href="#" class="cat"><h4 class="badge badge-info">${productID.category.name}</h4></a>
                            <br>
                            <a href="#" class="cat"><h4>Thương hiệu: ${productID.brand.name}</h4></a>
                            <h5 class="title">${productID.name}</h5>
                            <hr>
                            <div class="row justify-content-between">
                                <div class="col-sm-10">
                                    <c:if test="${promotion != null}">
                                       <span class="badge-pill badge-warning"><i class="fa fa-gift"></i>
                                           <strong>Khuyến mãi:</strong> ${promotion.title}
                                       </span>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${promotion != null}">
                                            <c:if test="${promotion.decrease.equals('Giảm theo %')}">
                                                <h5 class="price"><span class="old">
                                                <fmt:formatNumber type="number" groupingUsed="true"
                                                                  value="${productID.price}"/> ₫
                                            </span>
                                                    <p class="gia">
                                                        <fmt:formatNumber type="number" groupingUsed="true"
                                                                          value="${productID.money_Deals(promotion.moneyDeals)}"/>
                                                        ₫</p>
                                                </h5>
                                            </c:if>
                                            <c:if test="${promotion.decrease.equals('Giảm theo giá')}">
                                                <h4><strong>Giá:
                                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                                      value="${productID.money_price(promotion.moneyDeals)}"/>
                                                    ₫</strong></h4>
                                                <h6>
                                                    <del>
                                                        <fmt:formatNumber type="number" groupingUsed="true"
                                                                          value="${productID.price}"/>
                                                    </del>
                                                </h6>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <h5 class="price">
                                                <fmt:formatNumber type="number" groupingUsed="true"
                                                                  value="${productID.price}"/>₫</h5>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-sm-2">
                                    <c:choose>
                                        <c:when test="${productID.quantity == 0}">
                                            <h4><span class="badge badge-danger">Hết hàng</span></h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4><span class="badge badge-success">Còn hàng</span></h4>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${promotion != null}">
                                        <span class="text-danger font-weight-bold">-${promotion.formatDiscount()}%</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-product-description">
                        <div class="ratting">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <div class="specification">
                            <h5><strong>Thông tin sản phẩm</strong></h5>
                            <ul>
                                <li class="font-italic">CPU: ${productID.productInformation.cpu}</li>
                                <li class="font-italic">VGA: ${productID.productInformation.gpu}</li>
                                <li class="font-italic">Ram: ${productID.productInformation.ram}</li>
                                <li class="font-italic">Màn hình: ${productID.productInformation.display}</li>
                                <li class="font-italic">Màn hình: ${productID.productInformation.memory}</li>
                                <li class="font-italic">OS: ${productID.productInformation.oS}</li>
                                <li class="font-italic">Thời điểm ra
                                    mắt: ${productID.productInformation.timeOfLaunch}</li>
                            </ul>
                        </div>
                        <div class="actions">
                            <a href="/cartItem-product/${productID.id}" class="add-to-cart"><i
                                    class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                            <div class="wishlist-compare">
                                <a href="#" data-tooltip="Yêu thích"><i class="ti-heart"></i></a>
                            </div>
                        </div>
                        <%--<div class="tags">
                            <h5>Tags:</h5>
                        </div>--%>
                        <div class="share">
                            <h5>Chia sẻ: </h5>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-10 col-12 ml-auto mr-auto">
                <ul class="single-product-tab-list nav">
                    <li><a href="#product-description" class="active" data-toggle="tab">mô tả</a></li>
                    <li><a href="#product-specifications" data-toggle="tab">thông số kỹ thuật</a></li>
                    <li><a href="#product-reviews" data-toggle="tab">bình luận</a></li>
                </ul>
                <div class="single-product-tab-content tab-content">
                    <div class="tab-pane fade show active" id="product-description">
                        <div class="row" id="test">
                            <div class="single-product-description-content col-lg-8 col-12">
                                <h4>${productID.name}</h4>
                                <p>${productID.productInformation.description}</p>
                            </div>
                            <div class="single-product-description-image col-lg-4 col-12">
                                <img src="/getImage/${productID.imageList.get(0).url}" alt="description">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="product-specifications">
                        <div class="single-product-specification">
                            <div class="card-body">
                                <table class="table table-responsive-lg">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" class="text-danger font-weight-bold h5">Thông tin cấu hình:</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Hệ điều hành:</td>
                                        <td>${productID.productInformation.oS}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Màu sắc:</td>
                                        <td>${productID.productInformation.color}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">CPU:</td>
                                        <td>${productID.productInformation.cpu}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Card đồ hoạ:</td>
                                        <td>${productID.productInformation.gpu}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Màn hình:</td>
                                        <td style="width:70%">${productID.productInformation.display}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Ổ cứng:</td>
                                        <td>${productID.productInformation.memory}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">RAM:</td>
                                        <td>${productID.productInformation.ram}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Pin:</td>
                                        <td>${productID.productInformation.pin}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Kích thước:</td>
                                        <td>${productID.productInformation.size}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Thiết kế:</td>
                                        <td>${productID.productInformation.design}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Camera:</td>
                                        <td>${productID.productInformation.camera}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Camera phụ:</td>
                                        <td>${productID.productInformation.frontCamera}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Kết nối không dây:</td>
                                        <td>${productID.productInformation.wC}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Cổng kết nối:</td>
                                        <td>${productID.productInformation.connector}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Phụ kiện đi kèm:</td>
                                        <td>${productID.productInformation.accessories}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Bảo hành:</td>
                                        <td>${productID.productInformation.guarantee}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Thời gian ra mắt:</td>
                                        <td>${productID.productInformation.timeOfLaunch}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--<ul>
                                <li>CPU: ${productID.productInformation.cpu}</li>
                                <li>VGA: ${productID.productInformation.gpu}</li>
                                <li>Màn hình: ${productID.productInformation.display}</li>
                                <li>Ổ cứng: ${productID.productInformation.memory}</li>
                                <li>Ram: ${productID.productInformation.ram}</li>
                                <li>Hệ điêu hành: ${productID.productInformation.oS}</li>
                                <li>Thiết kế: ${productID.productInformation.design}</li>
                                <li>Kết nối không dây: ${productID.productInformation.wC}</li>
                                <li>Kích thước: ${productID.productInformation.size}</li>
                                <li>Cổng kết nối: ${productID.productInformation.connector}</li>
                                <li>PIN: ${productID.productInformation.pin}</li>
                                <li>Camera: ${productID.productInformation.camera}</li>
                                <li>Camera phụ: ${productID.productInformation.frontCamera}</li>
                                <li>Màu sắc: ${productID.productInformation.color}</li>
                                <li>Phụ kiện đi kèm: ${productID.productInformation.accessories}</li>
                                <li>Bảo hành: ${productID.productInformation.guarantee}</li>
                                <li>Thời điểm ra mắt: ${productID.productInformation.timeOfLaunch}</li>
                            </ul>--%>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="product-reviews">
                        <div class="product-ratting-wrap">
                            <div class="rattings-wrapper">
                                <c:forEach var="comment" items="${commentsList}">
                                    <div class="sin-rattings">
                                        <div class="ratting-author">
                                            <h3>${comment.account.username}</h3>
                                        </div>
                                        <p>${comment.comment}</p>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="ratting-form-wrapper fix">
                                <h3>Thêm bình luận của bạn</h3>
                                <form action="/comment/${productID.id}" method="post">
                                    <div class="ratting-form row">
                                        <div class="col-12 mb-15">
                                            <label for="your-review">Bình luận:</label>
                                            <textarea name="comment" id="your-review"
                                                      placeholder="Viết bình luận...."></textarea>
                                        </div>
                                        <div class="col-12">
                                            <input value="Thêm bình luận" type="submit">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- Single Product Section End -->
<!-- Related Product Section Start -->
<div class="product-section section mb-70">
    <div class="container">
        <div class="row">
            <!-- Section Title Start -->
            <div class="col-12 mb-40">
                <div class="section-title-one" data-title="RELATED PRODUCT"><h1>Sản phẩm bán chạy</h1></div>
            </div><!-- Section Title End -->
            <!-- Product Tab Content Start -->
            <div class="col-12">
                <!-- Product Slider Wrap Start -->
                <div class="product-slider-wrap product-slider-arrow-one">
                    <!-- Product Slider Start -->
                    <div class="product-slider product-slider-4">
                        <c:forEach var="product" items="${productSelling}">
                            <div class="col pb-20 pt-10">
                                <!-- Product Start -->
                                <div class="ee-product">
                                    <!-- Image -->
                                    <div class="image">
                                        <a href="/chitietsanpham/${product.id}" class="img"><img
                                                src="${pageContext.request.contextPath}/getImage/${product.imageList.get(0).url}"
                                                alt="Product Image"></a>
                                        <div class="wishlist-compare">
                                            <a href="#" data-tooltip="Yêu thích"><i class="ti-heart"></i></a>
                                        </div>
                                        <a href="#" class="add-to-cart"><i class="ti-shopping-cart"></i><span>Thêm vào giỏ hàng</span></a>
                                    </div>
                                    <!-- Content -->
                                    <div class="content">
                                        <!-- Category & Title -->
                                        <div class="category-title">
                                            <a href="" class="cat"><span
                                                    class="badge badge-info">${product.category.name}</span></a>
                                            <h5 class="title"><a
                                                    href="/chitietsanpham/${product.id}">${product.name}</a>
                                            </h5>
                                        </div>
                                        <!-- Price & Ratting -->
                                        <div class="price-ratting">
                                            <h5 class="price">
                                                <fmt:formatNumber type="number" groupingUsed="true"
                                                                  value="${product.price}"/>₫</h5>
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
                            </div>
                        </c:forEach>
                    </div><!-- Product Slider End -->
                </div><!-- Product Slider Wrap End -->
            </div><!-- Product Tab Content End -->
        </div>
    </div>
</div><!-- Related Product Section End -->
<script type="text/javascript">
        $('#test').showMore({
            minheight: 500,
            buttontxtmore: 'more content',
            buttontxtless: 'less content',
            buttoncss: 'btn btn-outline-info btn-small',
            animationspeed: 250
        });
</script>
<%@ include file="/includes/web/footer.jsp" %>
</body>
</html>
