<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý đơn hàng</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý đơn hàng</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <h3>Chi tiết đơn hàng</h3>
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-items-center"
                           style="text-align: center;" id="tblData">
                        <thead class="thead-light">
                        <tr>
                            <th>Stt</th>
                            <th style="width: 250px">Tên sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Loại</th>
                            <th>Giá bán</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${orderDetailList}" varStatus="i">
                            <tr>
                                <td>${i.index+1}</td>
                                <td>${order.product.name}</td>
                                <td><img class="rounded-lg" style="width: 60px;"
                                         src="/getImage/${order.product.imageList.get(0).url}"></td>
                                <td><span class="badge badge-warning">${order.product.category.name}</span></td>
                                <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.product.price}"/>
                                    ₫
                                </td>
                                <td>${order.quantity}</td>
                                <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.unitPrice}"/>
                                    ₫
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
