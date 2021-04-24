<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thống kê doanh thu theo khách hàng</h3>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
	<li class="breadcrumb-item active"> Thống kê</li>
</ol>
<div class="main-content-inner">
	<div class="card mb-4 shadow p-3 mb-5">
		<div class="row justify-content-center">
			<div class="col col-8">
				<jsp:include page="_revenue_customer_chart.jsp"/>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover"
					   id="dataTables-example">
					<thead>
					<tr>
						<th>Khách hàng</th>
						<th>Số đơn hàng</th>
						<th>Tổng tiền đã mua</th>
						<th>Số sản phẩm đã mua</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="e" items="${data}">
						<tr>
							<td>${e[0]}</td>
							<td>${e[1]}</td>
							<td><fmt:formatNumber value="${e[2]}" pattern="#,###"/> ₫</td>
							<td>${e[3]}</td>
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




