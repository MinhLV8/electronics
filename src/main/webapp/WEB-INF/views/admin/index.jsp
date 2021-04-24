<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<c:if test="${not empty mes}">
    <script type="text/javascript">
        Swal.fire({
            icon: 'success',
            title: '${mes}',
            showConfirmButton: false,
            timer: 1500
        })
    </script>
</c:if>
<h1 class="mt-4">Tổng quan</h1>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Trang chủ</li>
</ol>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card alert-primary text-dark mb-4">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs text-uppercase mb-1">
                            Đơn hàng
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">${donhang.size()}</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-dark stretched-link" href="${pageContext.request.contextPath}/admin/donhang">Xem
                    chi tiết</a>
                <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card alert-warning text-dark mb-4">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs text-uppercase mb-1">
                            Người dùng
                        </div>
                        <div class="h5 mb-0 font-weight-bold">${nguoidung.size()}</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-users fa-2x"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-dark stretched-link" href="/admin/taikhoan">Xem chi tiết</a>
                <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card alert-success text-dark mb-4">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs text-uppercase mb-1">
                            Doanh thu
                        </div>
                        <div class="h5 mb-0 font-weight-bold">
                            <fmt:formatNumber value="${doanhthu}" pattern="#,###" /> ₫</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-dark stretched-link" href="/admin/doanhthu/theloai">Xem chi tiết</a>
                <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card alert-danger text-dark mb-4">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs text-uppercase mb-1">
                            Bình luận
                        </div>
                        <div class="h5 mb-0 font-weight-bold">${binhluan.size()}</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-comments fa-2x"></i>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-dark stretched-link" href="#">Xem chi tiết</a>
                <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header"><i class="fas fa-chart-area mr-1"></i>Thống kê doanh thu</div>
            <div class="card-body">
                <jsp:include page="_revenue.jsp"/>
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card mb-4">
            <div class="card-header"><i class="fas fa-chart-pie mr-1"></i>Thống kê sản phẩm</div>
            <div class="card-body">
                <jsp:include page="_statistics.jsp"/>
            </div>
        </div>
    </div>
</div>
<div class="card mb-4">
    <div class="card-header"><i class="fas fa-table mr-1"></i>Danh sách sản phẩm sắp hết hàng</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTables-example" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>id</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Loại</th>
                    <th>Thương hiệu</th>
                    <th>Giá</th>
                    <th>Ngày thêm</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${listOut}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td class="text-danger">${product.quantity}</td>
                        <td>${product.category.name}</td>
                        <td>${product.brand.name}</td>
                        <td>${product.formatPrice()} ₫</td>
                        <td>${product.formatCreatedDate()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>








