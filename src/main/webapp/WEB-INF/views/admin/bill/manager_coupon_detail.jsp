<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý phiếu nhập- ${couponDetailList.size()} phiếu nhập</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý phiếu nhập</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <h3 class="text-lg-center font-weight-bold">Chi tiết phiếu nhập</h3>
            <div class="float-none">&nbsp;</div>
            <div class="row">
                <div class="col-4">
                    <p><strong>Mã phiếu nhập:</strong> ${enterCoupon.id}</p>
                    <p><strong>Tên nhân viên:</strong> ${enterCoupon.staff.account.name}</p>
                    <p><strong>Nhà cung cấp:</strong> ${enterCoupon.supplier.name}</p>
                    <p><strong>Ngày nhập:</strong> ${enterCoupon.formatDateAdded()}</p>
                    <p><strong>Tổng tiền:</strong>  <fmt:formatNumber type="number" groupingUsed="true" value="${enterCoupon.totalMoney}" /> ₫</p></div>
                <div class="col-8">
                </div>
            </div>
            <div class="col-xs-12">
                <h3 class="text-lg-center">Chi tiết sản phẩm phiếu nhập</h3>
                <div class="float-none">&nbsp;</div>
                <div class="table-responsive">
                    <table class="table table-hover align-items-center"
                           style="text-align: center;" id="tblData">
                        <thead class="thead-light">
                        <tr>
                            <th>No.</th>
                            <th>ID CT phiếu nhập</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá bán</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="couponDetail" items="${couponDetailList}" varStatus="i">
                            <tr class="info">
                                <td>${i.index+1}</td>
                                <td>${couponDetail.id}</td>
                                <td><img class="border border-secondary" style="width: 60px;"
                                         src="/getImage/${imageService.urlImage(couponDetail.product.id).url}"></td>
                                <td>${couponDetail.product.name}</td>
                                <td>${couponDetail.quantity}</td>
                                <td><fmt:formatNumber type="number" groupingUsed="true" value="${couponDetail.unitPrice}" /> ₫</td>
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
