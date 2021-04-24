<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý khuyến mãi - Có ${promotionList.size()} khuyến mãi</h3>
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
                            <a class="btn btn-primary" data-toggle="tooltip" href='/admin/khuyenmai/them'>
                                <i class="fas fa-plus"></i>
                                Thêm mới
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="table-responsive">
                <table class="table table-bordered table-hover"
                       style="text-align: center;" id="dataTables-example">
                    <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Hình thức</th>
                        <th>Mức giảm</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Xem</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="promontion" items="${promotionList}">
                        <tr>
                            <td>${promontion.id}</td>
                            <td>${promontion.title}</td>
                            <td>${promontion.decrease}</td>
                            <c:if test="${promontion.decrease.equals('Giảm theo %')}">
                                <td class="text-danger">-${promontion.formatDiscount()}%</td>
                            </c:if>
                            <c:if test="${promontion.decrease.equals('Giảm theo giá')}">
                                <td class="text-danger">
                                    -<fmt:formatNumber type="number" groupingUsed="true" value="${promontion.moneyDeals}"/>
                                    đ
                                </td>
                            </c:if>
                            <td>${promontion.formatStartDate()}</td>
                            <td>${promontion.formatEndDate()}</td>
                            <td class="align-middle">
                                <a class="btn btn-outline-info btn-sm" href="/admin/khuyenmai/chitiet/${promontion.id}">
                                    Chi tiết</a>
                            </td>
                            <td class="align-middle" style="text-align: center;">
                                <a class="btn btn-primary btn-sm" href="/admin/khuyenmai/capnhat/${promontion.id}">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a class="btn btn-danger btn-sm" href="/admin/khuyenmai/xoa/${promontion.id}">
                                    <i class="fa fa-trash"></i>
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
