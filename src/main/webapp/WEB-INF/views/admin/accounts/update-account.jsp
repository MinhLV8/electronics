<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 18/12/2020
  Time: 11:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<html>
<head>
    <title>Tài khoản</title>
</head>
<body>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Chỉnh sửa tài khoản người dùng</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý tài khoản</li>
                <li class="breadcrumb-item active">Chỉnh sửa</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <form:form modelAttribute="account" method="post" action="/admin/update-account" id="formInput">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>ID</label>
                            <form:input type="text" class="form-control" path="id" readonly="true"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Họ và tên</label>
                            <form:input type="text" class="form-control" required="true" path="name" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Tên đăng nhập</label>
                        <form:input type="text" class="form-control" autocomplete="off" readonly="true"
                                    path="username"/>
                    </div>
                        <form:input type="hidden" class="form-control" path="password" readonly="true"/>
                    <div class="form-group">
                        <label>Trạng thái: </label>
                        <div class="form-check form-check-inline">
                            <form:radiobutton cssClass="form-check-input" path="enabled" value="true"/>
                            <label class="form-check-label text-success">Hoạt động</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <form:radiobutton cssClass="form-check-input" path="enabled" value="false"/>
                            <label class="form-check-label text-danger">Khoá</label>
                        </div>
                            <%--<form:select path="enabled" class="form-control">
                                <form:options items="${enabled}"/>
                            </form:select>--%>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="far fa-save"></i> Lưu
                    </button>
                    <a href="/admin/taikhoan" class="btn btn-dark"><i class="fa fa-arrow-left"></i> Quay lại
                    </a>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
</body>
</html>
