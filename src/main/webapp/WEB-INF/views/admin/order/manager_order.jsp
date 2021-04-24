<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý đơn hàng - Có ${orderList.size()} đơn hàng</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý đơn hàng</li>
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
        <h3 class="text-lg-center font-weight-bold">Danh sách đơn hàng</h3>
        <div class="card-body">
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTables-example">
                        <thead class="thead-light">
                        <tr class="text-center">
                            <th>No.</th>
                            <th>Tài khoản</th>
                            <th>Người nhận</th>
                            <%--<th>Email</th>--%>
                            <th>SĐT</th>
                            <th style="width: 250px">Địa chỉ</th>
                            <th>Ngày mua</th>
                            <th>Tổng tiền</th>
                            <th>Nhân viên</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${orderList}" varStatus="i">
                            <tr class="text-center">
                                <td class="align-middle">${i.index+1}</td>
                                <td class="align-middle">${order.account.username}</td>
                                <td class="align-middle">${order.name}</td>
                                <%--<td class="align-middle">${order.email}</td>--%>
                                <td class="align-middle">${order.phone}</td>
                                <td class="align-middle">${order.address}</td>
                                <td class="align-middle">${order.formatDateOfBooking()}</td>
                                <td class="align-middle"><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}"/> ₫
                                </td>
                                <td class="align-middle">${order.staff.account.name}</td>
                                <c:choose>
                                    <c:when test="${order.status.equals('Chưa duyệt')}">
                                        <td class="align-middle"><span class="badge badge-warning">${order.status}</span></td>
                                    </c:when>
                                    <c:when test="${order.status.equals('Đã duyệt')}">
                                        <td class="align-middle"><span class="badge badge-info">${order.status}</span></td>
                                    </c:when>
                                    <c:when test="${order.status.equals('Đã hủy')}">
                                        <td class="align-middle"><span class="badge badge-danger">${order.status}</span></td>
                                    </c:when>
                                    <c:when test="${order.status.equals('Thất bại')}">
                                        <td class="align-middle"><span class="badge badge-danger">${order.status}</span></td>
                                    </c:when>
                                    <c:when test="${order.status.equals('Thành công')}">
                                        <td class="align-middle"><span class="badge badge-success">${order.status}</span></td>
                                    </c:when>
                                </c:choose>
                                <td class="align-middle" style="text-align: center;">
                                        <a class="btn btn-primary btn-sm" title="Xem chi tiết"
                                           href="/admin/edit-orderDetail/${order.id}"
                                            <%--data-toggle="modal" data-target="#exampleModal"--%>>
                                            <i class="fa fa-clipboard"></i>
                                        </a>
                                    <a class="btn btn-info btn-sm" href="/admin/edit-order/${order.id}">
                                        <i class="fas fa-pen"></i>
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
