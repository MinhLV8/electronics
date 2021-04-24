<%@ page pageEncoding="UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Thêm nhà cung cấp</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý nhà cung cấp</li>
                <li class="breadcrumb-item active">Thêm mới</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <form:form modelAttribute="supplier" method="post" action="/admin/save-supplier">
                    <div class="form-group">
                        <label>Tên nhà cung cấp:</label>
                        <form:input path="name" class="form-control" required="true" placeholder="Nhập tên nhà cung cấp"/>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại:</label><br>
                        <form:input path="phone" class="form-control" required="true" placeholder="Nhập số điện thoại"/>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ:</label>
                        <form:input path="address" class="form-control" required="true" placeholder="Nhập địa chỉ"/>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fa fa-plus"></i> Thêm nhà cung cấp</button>
                    <button type="reset" class="btn btn-warning"><i class="fa fa-undo-alt"></i> Reset</button>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>

