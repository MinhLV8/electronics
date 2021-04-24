<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Thêm khuyến mãi</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý khuyến mãi</li>
                <li class="breadcrumb-item active">Thêm khuyến mãi</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <c:if test="${not empty mes}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Lỗi!</strong> ${mes}.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </c:if>
                <h4 class="font-weight-bold">Thêm khuyến mãi mới</h4>
                <hr>
                <form:form modelAttribute="promotion" method="post" action="/admin/save-promotion">
                    <div class="form-group">
                        <label>Tiêu đề:</label>
                        <form:input path="title" class="form-control" required="true" placeholder="Nhập tiêu đề"/>
                    </div>
                    <div class="form-group">
                        <label>Giảm theo:</label>
                        <form:select path="decrease" class="form-control">
                            <form:options items="${decrease}"/>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label>Mức giảm:</label>
                        <input type="text" class="form-control" name="money" required placeholder="Nhập mức giảm"
                               pattern="[0-9]*">
                    </div>
                    <div class="form-group">
                        <label>Ngày bắt đầu:</label>
                        <form:input type="date" path="startDate" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Ngày kết thúc:</label>
                        <form:input type="date" path="endDate" class="form-control" required="true"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> Thêm khuyến mãi</button>
                    <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại
                    </button>
                    <a href="/admin/khuyenmai" class="btn btn-dark"><i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                </form:form>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
