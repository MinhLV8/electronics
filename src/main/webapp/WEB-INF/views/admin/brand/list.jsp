<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thương hiệu</title>
</head>
<body>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thương hiệu - ${brandList.size()} thương hiệu</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý thương hiệu</li>
</ol>
<div class="main-content-inner">
    <div class="row justify-content-md-center row-cols-2">
        <div class="card mb-4 shadow p-3 mb-5">
            <div class="card-body">
                <div class="d-flex bd-highlight">
                    <div class="p-2 flex-grow-1 bd-highlight">
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group mr-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#exampleModal"><i class="fas fa-plus"></i>
                                    Thêm mới
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="float-none">&nbsp;</div>
                <c:if test="${not empty success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Thành công!</strong> ${success}.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped table-bordered"
                               style="text-align: center;" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Tên thương hiệu</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="brand" items="${brandList}" varStatus="i">
                                <tr>
                                    <td>${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td>
                                        <a class="btn btn-primary btn-sm"
                                           href="/admin/thuonghieu/capnhat/${brand.id}"><i class="fa fa-edit"></i> Sửa
                                        </a>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <a class="btn btn-danger btn-sm" href="/admin/thuonghieu/xoa/${brand.id}">
                                                <i class="fa fa-trash"></i> Xoá
                                            </a>
                                        </sec:authorize>
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
</div>
</main>
<%--modal them--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/admin/save-brand" id="formInput">
                    <div class="form-row">
                        <label>Tên thương hiệu</label>
                        <input type="text" class="form-control" required="true" name="name" id="name"/>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary"><i class="far fa-edit"></i> Lưu
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/includes/admin/footer.jsp" %>
</body>
</html>