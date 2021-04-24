<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thêm phiếu nhập mới</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item"> Quản lý phiếu nhập</li>
    <li class="breadcrumb-item active"> Thêm mới</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <h3 class="text-lg-center font-weight-bold">Thêm phiếu nhập mới</h3>
            <div class="float-none">&nbsp;</div>
            <c:if test="${not empty success}">
                <script type="text/javascript">
                    $(document).ready(function () {
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
                <form:form modelAttribute="enterCoupon" method="post"
                           action="/admin/update-enter-coupon">
                    <form:input path="id" type="hidden" class="form-control" readonly="true"/>
                    <p><strong>Mã phiếu nhập:</strong> ${enterCoupon.id}</p>
                    <p><strong>Tên nhân viên:</strong> ${enterCoupon.staff.account.name}</p>
                    <p><strong>Ngày nhập:</strong> ${enterCoupon.formatDateAdded()}</p>
                    <p><strong>Tổng tiền:</strong> <fmt:formatNumber type="number" groupingUsed="true"
                                                                     value="${enterCoupon.totalMoney}"/> ₫</p>
                    <form:input type="hidden" path="dateAdded" class="form-control"/>
                    <div class="form-group">
                        <label class="font-weight-bold">Nhà cung cấp</label>
                        <form:select path="supplier.id" class="form-control">
                            <form:options items="${supplierList}"/>
                        </form:select>
                    </div>
                    <form:input path="totalMoney" type="hidden" class="form-control" readonly="true"/>
                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Lưu</button>
                    <a href="${pageContext.request.contextPath}/admin/phieunhap" class="btn btn-dark">
                        <i class="fa fa-arrow-left"></i> Quay lại</a>
                </form:form>
            </div>
            <hr>
            <blockquote class="blockquote text-center">
                <p class="mb-0 h3 font-weight-bolder">Chi tiết phiếu nhập</p>
            </blockquote>
            <div class="col-xs-12">
                <div class="row justify-content-center">
                    <form:form modelAttribute="couponDetail" method="post"
                               action="/admin/save-couponDetail/${enterCoupon.id}" id="formCouponDetail">
                        <form:input type="hidden" path="enterCoupon.id" class="form-control" required="true"
                                    value="${enterCoupon.id}"/>
                        <div class="form-row align-items-center">
                            <div class="col-sm-6 my-1">
                                <form:select path="product.id" class="form-control">
                                    <form:options items="${productList}"/>
                                </form:select>
                            </div>
                            <div class="col-sm-3 my-1">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Số lượng</div>
                                    </div>
                                    <form:input path="quantity" class="form-control" required="true"
                                                type="number" pattern="[0-9]*" min="1"/>
                                </div>
                            </div>
                            <div class="col-auto my-1">
                                <button type="submit" onclick="myFunction()" class="btn btn-success"><i
                                        class="fa fa-plus"></i> Thêm
                                </button>
                            </div>
                        </div>
                    </form:form>
                    <div class="float-none">&nbsp;</div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover"
                               style="text-align: center;" id="dataTables-example">
                            <thead class="thead-light">
                            <tr>
                                <th>No.</th>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá bán</th>
                                <th>Thành tiền</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty couponDetailList}">
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <strong>Không có sản phẩm trong phiếu nhập này!</strong>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="couponDetailList" items="${couponDetailList}" varStatus="i">
                                        <tr class="text-center">
                                            <td class="align-middle">${i.index+1}</td>
                                            <td class="align-middle"><img class="border border-secondary"
                                                                          style="width: 60px;"
                                                                          src="/getImage/${imageService.urlImage(couponDetailList.product.id).url}">
                                            </td>
                                            <td class="align-middle">${couponDetailList.product.name}</td>
                                            <td class="align-middle">${couponDetailList.quantity}</td>
                                            <td class="align-middle"><fmt:formatNumber type="number" groupingUsed="true"
                                                                                       value="${couponDetailList.product.price}"/>
                                                ₫
                                                <a class="btn btn-outline-info btn-sm"
                                                   href="/admin/sanpham/capnhat/${couponDetailList.product.id}">
                                                    <i class="fa fa-edit"></i>
                                                </a></td>
                                            <td class="align-middle"><fmt:formatNumber type="number" groupingUsed="true"
                                                                                       value="${couponDetailList.unitPrice}"/>
                                                ₫
                                            </td>
                                            <td class="align-middle">
                                                <a class="btn btn-danger btn-sm"
                                                   href="/admin/${enterCoupon.id}/delete-couponDetail/${couponDetailList.id}">
                                                    <i class="fa fa-trash"></i> Xoá
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<script>
    function myFunction() {
        var x, text;
        x = document.getElementById("numb").value;
        if (isNaN(x) || x < 1) {
            text = "Input not valid";
        } else {
            text = "Input OK";
        }
        document.getElementById("demo").innerHTML = text;
    }
</script>
<%@ include file="/includes/admin/footer.jsp" %>