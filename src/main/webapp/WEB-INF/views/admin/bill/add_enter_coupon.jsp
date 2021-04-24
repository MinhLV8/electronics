<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thêm phiếu nhập mới</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item"> Quản lý phiếu nhập</li>
    <li class="breadcrumb-item active"> Thêm mới</li>
</ol>
<div class="main-content-inner">
    <div class="row justify-content-md-center row-cols-2">
        <div class="card mb-4 shadow p-3 mb-5">
            <div class="card-body">
                <h3 class="text-lg-center font-weight-bold">Thêm phiếu nhập mới</h3>
                <div class="float-none">&nbsp;</div>
                <%--<c:if test="${not empty success}">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            Swal.fire({
                                icon: 'success',
                                title: '${success}',
                                showConfirmButton: false,
                                timer: 1500
                            })
                        });
                    </script>
                </c:if>--%>
                <c:if test="${not empty mes}">
                    <script type="text/javascript">
                        Swal.fire(
                            'Lỗi rồi bạn êii !!!',
                            '${mes}!',
                            'error'
                        )
                    </script>
                </c:if>
                <div class="row justify-content-center">
                    <form:form modelAttribute="coupon" method="post" action="/admin/save-enter-coupon">
                        <div class="form-group">
                            <label class="font-weight-bold">Nhà cung cấp</label>
                            <form:select path="supplier.id" class="form-control">
                                <form:options items="${supplierList}"/>
                            </form:select>
                        </div>
                        <%--<div class="form-group">
                            <label>Tổng tiền: (hệ thống sẽ tự cập nhật khi thêm sản phẩm vào phiếu)</label>
                            <input type="text" class="form-control" readonly>
                        </div>--%>
                        <button type="sumit" class="btn btn-primary"><i class="fas fa-check"></i> Thêm mới</button>
                        &nbsp;
                        <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại
                        </button>
                        &nbsp;
                        <a href="${pageContext.request.contextPath}/admin/phieunhap" class="btn btn-dark">
                            <i class="fa fa-arrow-left"></i> Quay lại
                        </a>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
