<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thống kê sản phẩm tồn kho theo loại</h3>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
	<li class="breadcrumb-item active"> Thống kê</li>
</ol>
<div class="main-content-inner">
	<div class="card mb-4 shadow p-3 mb-5">
		<div class="row justify-content-center">
			<div class="col col-8">
				<jsp:include page="_revenue_by_category_chart.jsp" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover"
					   id="dataTables-example">
					<thead>
					<tr>
						<th>Loại</th>
						<th>Số lượng đã bán</th>
						<th>Doanh thu</th>
						<th>Đơn thấp nhất</th>
						<th>Đơn cao nhất</th>
						<th>Trung bình</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="e" items="${data}">
						<tr>
							<td>${e[0]}</td>
							<td>${e[1]}</td>
							<td><fmt:formatNumber value="${e[2]}" pattern="#,###" /> ₫</td>
							<td><fmt:formatNumber value="${e[3]}" pattern="#,###" /> ₫</td>
							<td><fmt:formatNumber value="${e[4]}" pattern="#,###" /> ₫</td>
							<td><fmt:formatNumber value="${e[5]}" pattern="#,###" /> ₫</td>
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