<%@ page pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý nhà cung cấp - ${supplierList.size()} nhà cung cấp</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý nhà cung cấp</li>
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
                            <a class="btn btn-primary" data-toggle="tooltip" href="/admin/nhacungcap/them">
                                <i class="fas fa-plus"></i>
                                Thêm mới
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="float-none">&nbsp</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover"
                           style="text-align: center;" id="dataTables-example">
                        <thead class="thead-light">
                        <tr>
                            <th style="width: 50px;vertical-align: middle;">Id</th>
                            <th style="width: 50px;vertical-align: middle;">Nhà cung cấp</th>
                            <th style="width: 100px;vertical-align: middle;">Số điện thoại</th>
                            <th style="width: 100px;vertical-align: middle;">Địa chỉ</th>
                            <th style="width: 90px">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="supplierList" items="${supplierList}">
                            <tr>
                                <td>${supplierList.id}</td>
                                <td class="align-middle"><p>${supplierList.name}</p></td>
                                <td class="align-middle">${supplierList.phone}</td>
                                <td class="align-middle">${supplierList.address}</td>
                                <td class="align-middle" style="text-align: center;">
                                    <a class="btn btn-primary btn-sm"
                                       href="/admin/nhacungcap/capnhat/${supplierList.id}">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a class="btn btn-danger btn-sm" href="/admin/nhacungcap/xoa/${supplierList.id}">
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
<%@ include file="/includes/admin/footer.jsp" %>
