<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Thống kê doanh thu theo quý</h3>
<ol class="breadcrumb mb-4">
	<li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
	<li class="breadcrumb-item active"> Thống kê</li>
</ol>
<div class="main-content-inner">
	<div class="card mb-4 shadow p-3 mb-5">
		<div class="row justify-content-center">
			<div class="col col-8">
				<jsp:include page="_revenue_quarter_chart.jsp"/>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover"
					   id="dataTables-example">
					<thead>
					<tr>
						<th>Quý</th>
						<th>Số lượng đơn hàng</th>
						<th>Doanh thu</th>
						<th>Số lượng sản phẩm đã bán</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="e" items="${data}">
						<tr>
							<td>Quý ${e[0]}</td>
							<td>${e[1]}</td>
							<td><fmt:formatNumber value="${e[2]}" pattern="#,###" /> ₫</td>
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