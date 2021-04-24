<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý khuyến mãi</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý sản phẩm khuyến mãi</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <h3>Chi tiết khuyến mãi</h3>
            <a href="${pageContext.request.contextPath}/admin/khuyenmai" class="btn btn-dark"><i class="fa fa-arrow-left"></i> Quay lại</a>
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <c:if test="${promotionProductList.size() == 0}">
                    <h4 style="text-align: center">không có sản phẩm nào...!</h4>
                </c:if>
                <c:if test="${promotionProductList.size() > 0}">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-items-center"
                               style="text-align: center;" id="dataTables-example">
                            <thead class="thead-light">
                            <tr>
                                <th>No.</th>
                                <th>Tên khuyến mãi</th>
                                <th style="width: 200px">Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Deals</th>
                                <th>Giá bán</th>
                            </tr>
                            </thead>
                            <tbody class="font-weight-bold">
                            <c:forEach var="promotion" items="${promotionProductList}" varStatus="i">
                                <tr class="info">
                                        <%--<td>${promotion.id}</td>--%>
                                    <td>${i.index+1}</td>
                                    <td>${promotion.promotion.title}</td>
                                    <td>
                                        <img class="img-thumbnail" style="width:50%" src="/getImage/${promotion.product.imageList.get(0).url} " width="100px" height="100px">
                                    </td>
                                    <td>${promotion.product.name}</td>
                                    <td class="text-danger">-${promotion.promotion.formatDiscount()}%</td>
                                    <td>
                                        <fmt:formatNumber type="number" groupingUsed="true" value="${promotion.product.price}"/>
                                        ₫
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
