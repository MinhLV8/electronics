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
            <h3 class="text-lg-center font-weight-bold">Duyệt đơn hàng</h3>
            <div class="float-none">&nbsp;</div>
            <div class="row">
                <div class="col-4">
                    <p><strong>Mã đơn hàng:</strong> ${order.id}</p>
                    <p><strong>Tài khoản:</strong> ${order.account.username}</p>
                    <p><strong>Email:</strong> ${order.email}</p>
                    <p><strong>Ngày mua:</strong> ${order.formatDateOfBooking()}</p>
                    <p><strong>Tổng tiền:</strong> ${order.formatTotalMoney(order.totalMoney)}₫</p></div>
                <div class="col-8">
                    <form:form modelAttribute="order" method="post" action="/admin/update-order">
                        <form:input path="id" type="hidden"/>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-2 col-form-label font-weight-bold">Tên người nhận :</label>
                            <div class="col-sm-10">
                                <form:input path="name" class="form-control" required="true"/>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-2 col-form-label font-weight-bold">Số điện thoại :</label>
                            <div class="col-sm-10">
                                <form:input path="phone" class="form-control" required="true"/>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-2 col-form-label font-weight-bold">Địa chỉ :</label>
                            <div class="col-sm-10">
                                <form:input path="address" class="form-control" required="true"/>
                            </div>
                        </div>
                        <div class="form-group row text-lg-right">
                            <label class="col-sm-2 col-form-label font-weight-bold">Trạng thái :</label>
                            <div class="col-sm-2">
                                <form:select path="status" class="form-control">
                                    <form:options items="${status}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label font-weight-bold"></label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Lưu lại
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            <div class="col-xs-12">
                <h3>Chi tiết đơn hàng</h3>
                <div class="float-none">&nbsp;</div>
                <div class="table-responsive">
                    <table class="table table-hover align-items-center"
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
                                <td><img class="img-thumbnail" style="width: 60px;"
                                         src="/getImage/${order.product.imageList.get(0).url}"></td>
                                <td><span class="badge badge-warning">${order.product.category.name}</span></td>
                                <td>
                                    <fmt:formatNumber type="number" groupingUsed="true" value="${order.product.price}"/>
                                    ₫
                                </td>
                                <td>${order.quantity}</td>
                                <td>
                                    <fmt:formatNumber type="number" groupingUsed="true" value="${order.unitPrice}"/>
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
