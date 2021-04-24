<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 18/12/2020
  Time: 11:25 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<c:if test="${not empty message}">
    <script type="text/javascript">
        $(document).ready(function () {
            ${message}
        });
    </script>
</c:if>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Chỉnh sửa thông tin nhân viên</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý nhân viên</li>
                <li class="breadcrumb-item active">Cập nhật</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <form:form modelAttribute="staff" method="post" action="/admin/update-staff" id="formInput">
                    <form:input type="hidden" path="id" class="form-control-plaintext" disabled="true" readonly="true"/>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Tên đăng nhập</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control-plaintext" disabled="true" readonly="true" value="${staff.account.username}"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Tên nhân viên</label>
                        <div class="col-sm-8">
                            <form:input path="account.name" type="text" class="form-control" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Số điện thoại</label>
                        <div class="col-sm-8">
                            <form:input path="phone" type="text" class="form-control" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Địa chỉ</label>
                        <div class="col-sm-8">
                            <form:input path="address" type="text" class="form-control" autocomplete="off"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Chức vụ</label>
                        <div class="col-sm-8">
                            <form:select path="position" class="form-control">
                                <form:options items="${position}"/>
                            </form:select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="far fa-edit"></i> Lưu</button>
                    <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại</button>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>

