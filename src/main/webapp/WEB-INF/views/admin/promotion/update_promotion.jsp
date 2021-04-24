<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý khuyến mãi</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item"> Quản lý khuyến mãi</li>
    <li class="breadcrumb-item active"> Chỉnh sửa khuyến mãi</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <h3 class="text-lg-center font-weight-bold">Chỉnh sửa khuyến mãi</h3>
            <div class="float-none">&nbsp;</div>
            <c:if test="${not empty success}">
                <script type="text/javascript">
                    $(document).ready(function() {
                    Swal.fire({
                        icon: 'success',
                        title: '${success}',
                        showConfirmButton: false,
                        timer: 1500
                    })
                    });
                </script>
            </c:if>
            <c:if test="${not empty mes}">
                <script type="text/javascript">
                    Swal.fire(
                        'Lỗi rồi bạn êii !!!',
                        '${mes}!',
                        'error'
                    )
                </script>
            </c:if>
            <div class="row justify-content-center">
                <div class="col col-lg-4">
                    <form:form modelAttribute="promotion" method="post"
                               action="/admin/update-promotion/${promotion.id}">
                        <form:input path="id" type="hidden" class="form-control" readonly="true"/>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-4 col-form-label font-weight-bold">Tên khuyến mãi :</label>
                            <div class="col-sm-8">
                                <form:input path="title" class="form-control" required="true"
                                            placeholder="Nhập tiêu đề"/>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-4 col-form-label font-weight-bold">Hình thức :</label>
                            <div class="col-sm-8">
                                <form:select path="decrease" class="form-control">
                                    <form:options items="${decrease}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-4 col-form-label font-weight-bold">Mức giảm :</label>
                            <div class="input-group col-sm-8">
                                <form:input path="moneyDeals" class="form-control" required="true"
                                            placeholder="Nhập mức giảm" pattern="[0-9][0-9]*"/>
                                <div class="input-group-append">
                                    <c:if test="${promotion.decrease.equals('Giảm theo %')}">
                                        <span class="input-group-text">%</span>
                                    </c:if>
                                    <c:if test="${promotion.decrease.equals('Giảm theo giá')}">
                                        <span class="input-group-text">₫</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-4 col-form-label font-weight-bold">Ngày bắt đầu :</label>
                            <div class="col-sm-8">
                                <form:input type="date" path="startDate" class="form-control" required="true"/>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-4 col-form-label font-weight-bold">Ngày kết thúc :</label>
                            <div class="col-sm-8">
                                <form:input type="date" path="endDate" class="form-control" required="true"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4 text-lg-right"></div>
                                <%--<label class="col-sm-4 col-form-label font-weight-bold"></label>--%>
                            <div class="col-sm-8">
                                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Lưu
                                </button>
                                <a class="btn btn-dark"
                                   href="${pageContext.request.contextPath}/admin/khuyenmai">
                                    <i class="fas fa-arrow-left"></i> Quay lại</a>
                                    <%--<a class="btn btn-primary" href="/admin/${promotion.id}/themspkm">
                                        <i class="fa fa-plus"></i> Thêm sản phẩm KM</a>--%>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            <hr>
            <blockquote class="blockquote text-center">
                <p class="mb-0 h3 font-weight-bolder">Danh sách sản phẩm của khuyến mãi <span
                        class="badge badge-warning rounded-lg">${promotion.title}</span></p>
            </blockquote>
            <div class="col-xs-12">
                <div class="row justify-content-center">
                    <form:form modelAttribute="PromotionProduct" method="post"
                               action="/admin/save-promotion-product/${promotionID}" cssClass="form-inline">
                        <div class="form-group">
                            <form:input path="promotion.id" type="hidden" value="${promotionID}"/>
                        </div>
                        <form:select path="product.id" class="form-control">
                            <form:options items="${productList}"/>
                        </form:select>&nbsp;
                        <button type="submit" class="btn btn-success my-1"><i class="fas fa-plus"></i> Thêm
                        </button>
                    </form:form>
                </div>
                <div class="col">
                </div>
                <div class="float-none">&nbsp;</div>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover"
                           style="text-align: center;" id="dataTables-example">
                        <thead class="thead-light">
                        <tr>
                            <th>Id</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Loại</th>
                            <th>Giá bán</th>
                            <th>Giảm</th>
                            <th>Giá khuyến mãi</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody class="font-weight-bolder">
                        <c:if test="${empty promotionProductList}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Không có sản phẩm trong chương trình khuyến mãi này!</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>
                        <c:forEach var="promotion" items="${promotionProductList}">
                            <tr>
                                <td>${promotion.id}</td>
                                <td>
                                    <img class="img-thumbnail" style="width: 60px"
                                         src="/getImage/${promotion.product.imageList.get(0).url}" alt="thumbnail"/>
                                </td>
                                <td>${promotion.product.name}</td>
                                <td>${promotion.product.category.name}</td>
                                <td>
                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                      value="${promotion.product.price}"/>
                                    ₫
                                </td>
                                <c:if test="${promotion.promotion.decrease.equals('Giảm theo %')}">
                                    <td class="text-danger">-${promotion.promotion.formatDiscount()}%</td>
                                </c:if>
                                <c:if test="${promotion.promotion.decrease.equals('Giảm theo giá')}">
                                    <td class="text-danger">-<fmt:formatNumber type="number" groupingUsed="true"
                                                                               value="${promotion.promotion.formatDiscount()}"/>
                                        ₫
                                    </td>
                                </c:if>
                                <td class="text-success">
                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                      value="${promotion.product.money_Deals(promotion.product.id)}"/> ₫
                                </td>
                                <td>
                                        <%--<a class="btn btn-primary btn-sm"
                                           href="/admin/edit-PromotionProduct/${promotion.id}">
                                            <i class="fa fa-edit"></i>
                                        </a>--%>
                                    <a class="btn btn-danger btn-sm"
                                       href="/admin/${promotion.promotion.id}/delete-promotion-product/${promotion.id}">
                                        <i class="fa fa-trash"></i> Xoá
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
