<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Phiếu nhập- ${enterCouponList.size()} phiếu nhập</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý phiếu nhập</li>
</ol>
<div class="main-content-inner">
    <c:if test="${not empty success}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'success',
                title: '${success}',
                showConfirmButton: false,
                timer: 1500
            })
        </script>
    </c:if>
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <div class="d-flex bd-highlight">
                <div class="p-2 flex-grow-1 bd-highlight">
                    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                        <div class="btn-group mr-2" role="group" aria-label="First group">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/phieunhap/them"><i class="fas fa-plus"></i>
                                Thêm mới phiếu nhập
                            </a>
                        </div>
                        <div class="btn-group mr-2" role="group" aria-label="Second group">
                            <a class="btn btn-info" href='${pageContext.request.contextPath}/admin/nhacungcap/them'>
                                <i class="fas fa-plus"></i>
                                Thêm nhà cung cấp
                            </a>
                        </div>
                        <div class="btn-group mr-2" role="group" aria-label="Second group">
                            <a class="btn btn-info" href='${pageContext.request.contextPath}/admin/sanpham/them'>
                                <i class="fas fa-plus"></i>
                                Thêm mới sản phẩm
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="dataTables-example">
                        <thead class="thead-light">
                        <tr class="text-center">
                            <th>No.</th>
                            <th>Tên nhân viên</th>
                            <th>Ngày nhập</th>
                            <th>Nhà cung cấp</th>
                            <th>Tổng tiền</th>
                            <th>Chi tiết</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="enterCoupon" items="${enterCouponList}" varStatus="i">
                            <tr class="text-center">
                                <td>${i.index+1}</td>
                                <td class="align-middle">${enterCoupon.staff.account.name}</td>
                                <td class="align-middle">${enterCoupon.formatDateAdded()}</td>
                                <td class="align-middle">${enterCoupon.supplier.name}</td>
                                <td class="align-middle">
                                    <fmt:formatNumber type="number" groupingUsed="true"
                                                      value="${enterCoupon.totalMoney}"/> ₫
                                </td>
                                <td class="align-middle">
                                    <a class="btn btn-outline-info btn-sm"
                                       href="/admin/phieunhap/chitiet/${enterCoupon.id}">Chi tiết</a>
                                    <a class="btn btn-info btn-sm" href='/admin/phieunhap/capnhat/${enterCoupon.id}'>
                                        <i class="fas fa-plus"></i>
                                        Thêm chi tiết
                                    </a>
                                </td>
                                <td class="align-middle" style="text-align: center;">
                                    <a class="btn btn-info btn-sm" href="/admin/phieunhap/capnhat/${enterCoupon.id}">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <c:choose>
                                        <c:when test="${empty enterCoupon.couponDetailsList}">
                                            <a class="btn btn-danger btn-sm" href="/admin/phieunhap/xoa/${enterCoupon.id}">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </c:when>
                                    </c:choose>
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
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
