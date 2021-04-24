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
    <title>Thương hiệu</title>
</head>
<body>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Cập nhật thương hiệu</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý thương hiệu</li>
                <li class="breadcrumb-item active">Cập nhật</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <form:form modelAttribute="brand"  method="post" action="/admin/save-update-brand" id="formInput">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>ID</label>
                            <form:input type="text" class="form-control" path="id" id="brandID" readonly="true" placeholder="Tự động sinh mã"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Tên thương hiệu</label>
                            <form:input type="text" class="form-control" required="true" path="name"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="far fa-edit"></i> Cập
                        nhật</button>
                    <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại
                    </button>&nbsp;
                    <a class="btn btn-dark" href='#'>
                        <i class="fas fa-arrow-circle-left"></i> Quay lại</a>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
</body>
</html>
