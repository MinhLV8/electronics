<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Lịch sử mua hàng</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/web/assets/images/favicon.png">
</head>
<body>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/web/header.jsp" %>
<!-- Page Banner Section Start -->
<div class="page-banner-section section">
    <div class="page-banner-wrap row row-0 d-flex align-items-center justify-content-center">
        <!-- Page Banner -->
        <div class="col-lg-4 col-12 order-lg-2 d-flex align-items-center justify-content-center">
            <div class="page-banner">
                <h1>Đơn hàng đã mua</h1>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Lịch sử mua hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!-- Page Banner Section End --><!-- Compare Page Start -->
<c:if test="${not empty success}">
    <script type="text/javascript">
        Swal.fire({
            icon: 'success',
            title: '${success}',
            showConfirmButton: false,
            timer: 1500
        })
    </script>
</c:if>
<div class="page-section section mt-90 mb-90">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <c:if test="${orderList.pageList.size() == 0}">
                    <div class="alert alert-warning" role="alert">
                        Không có đơn hàng nào. Về <a href="${pageContext.request.contextPath}/trangchu" class="alert-link">trang chủ</a>.
                    </div>
                </c:if>
                <!-- Compare Table -->
                <c:if test="${orderList.pageList.size() > 0}">
                    <div class="cart-table table-responsive mb-40">
                        <table class="table mb-0">
                            <thead>
                            <th>SĐT</th>
                            <th>Email</th>
                            <th>Địa chỉ</th>
                            <th>Ngày mua</th>
                            <th>Tổng tiền</th>
                            <th>Tình trạng</th>
                            <th>Chi tiết</th>
                            </thead>
                            <c:forEach var="order" items="${orderList.pageList}">
                                <tbody>
                                <td>${order.phone}</td>
                                <td>${order.email}</td>
                                <td>${order.address}</td>
                                <td>${order.formatDateOfBooking()}</td>
                                <td><fmt:formatNumber type="number" groupingUsed="true" value="${order.totalMoney}"/> ₫
                                </td>
                                <c:if test="${order.status.equals('Chưa duyệt')}">
                                    <td><a class="btn btn-text" href="/user/huydonhang/${order.id}">Hủy đơn hàng</a></td>
                                </c:if>
                                <c:if test="${order.status.equals('Đã duyệt')}">
                                    <td><span class="badge badge-success">Đã xác nhận</span></td>
                                </c:if>
                                <c:if test="${order.status.equals('Đã hủy')}">
                                    <td><span class="badge badge-danger">Đã hủy</span></td>
                                </c:if>
                                <c:if test="${order.status.equals('Thất bại')}">
                                    <td><span class="badge badge-dark">Thất bại</span></td>
                                </c:if>
                                <c:if test="${order.status.equals('Thành công')}">
                                    <td><span class="badge badge-success">Đã nhận hàng</span></td>
                                </c:if>
                                <td><a class="btn btn-outline-info btn-small" href="/user/chitietdonhang/${order.id}">Xem chi tiết</a></td>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
                <%--<div class="row justify-content-md-center">
                    <div class="row mt-30">
                        <div class="col">
                            <ul class="pagination">
                                <li><a href="#"><i class="fa fa-angle-left"></i>Back</a></li>
                                <li><a href="#">1</a></li>
                                <li class="active"><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li> - - - </li>
                                <li><a href="#">18</a></li>
                                <li><a href="#">18</a></li>
                                <li><a href="#">20</a></li>
                                <li><a href="#">Next<i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>
<!-- Compare Page End -->
<%@ include file="/includes/web/footer.jsp" %>
</body>
</html>