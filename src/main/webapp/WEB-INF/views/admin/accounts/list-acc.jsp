<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Quản lý tài khoản - ${accountList.pageList.size()} tài khoản</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý tài khoản</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover"
                           style="text-align: center;" id="dataTables-example">
                        <thead class="table-active">
                        <tr>
                            <th>Id</th>
                            <th>Họ và tên</th>
                            <th>Tên đăng nhập</th>
                            <th>Ngày đăng ký</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="account" items="${accountList.pageList}">
                            <tr>
                                <td>${account.id}</td>
                                <td><p>${account.name}</p></td>
                                <td>
                                    ${account.username}
                                </td>
                                <td>${account.formatCreatedDate()}</td>
                                <c:if test="${account.enabled == true}">
                                    <td><span class="badge badge-success">Hoạt động</span></td>
                                </c:if>
                                <c:if test="${account.enabled == false}">
                                    <td><span class="badge badge-danger">Khoá</span></td>
                                </c:if>
                                <td class="align-middle" style="text-align: center;">
                                    <a class="btn btn-primary btn-sm" href="/admin/taikhoan/capnhat/${account.id}">
                                        <i class="fa fa-edit"></i> Sửa
                                    </a>
                                    <a class="btn btn-danger btn-sm" href="/admin/taikhoan/xoa/${account.id}">
                                        <i class="fa fa-trash"></i> Xoá
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <%--<hr class="my-4">
                    <div class="d-flex align-items-sm-start bd-highlight">
                        <div class="p-2 flex-grow-1 bd-highlight">Hiển thị ${currentIndex} của ${totalPageCount}
                            trang
                        </div>
                        <div class="p-2 bd-highlight" id="page-pagination">
                            <nav aria-label="Page navigation example" class="pagination">
                                <ul class="pagination justify-content-end" id="pagination">
                                    <li class="${currentIndex == 1 ? 'page-item disabled': 'page-item'} ">
                                        <a class="page-link" href="${baseUrl}${1}">Đầu</a>
                                    </li>
                                    <li class="${currentIndex == 1 ? 'page-item disabled': 'page-item'} ">
                                        <a class="page-link" href="${baseUrl}${currentIndex - 1}"
                                           aria-disabled="true">Trước</a>
                                    </li>
                                    <c:if test="${totalPageCount <= 10}">
                                        <c:forEach var="item" begin="${1}" end="${totalPageCount}">
                                            <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                <a class="page-link" href="${baseUrl}${item}">${item}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${totalPageCount > 10}">
                                        <c:if test="${currentIndex <= 3 or currentIndex > totalPageCount-2}">
                                            <c:forEach var="item" begin="${1}" end="${3}">
                                                <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                    <a class="page-link" href="${baseUrl}${item}">${item}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                <a class="page-link" href="${baseUrl}${4}">...</a>
                                            </li>
                                            <c:forEach var="item" begin="${totalPageCount-2}" end="${totalPageCount}">
                                                <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                    <a class="page-link" href="${baseUrl}${item}">${item}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${currentIndex > 3 and currentIndex <= totalPageCount-2}">
                                            <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                <a class="page-link" href="${baseUrl}${currentIndex - 3}">...</a>
                                            </li>
                                            <c:forEach var="item" begin="${currentIndex-2}" end="${currentIndex + 2}">
                                                <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                    <a class="page-link" href="${baseUrl}${item}">${item}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="${item == currentIndex ? 'page-item active': 'page-item'}">
                                                <a class="page-link" href="${baseUrl}${currentIndex + 3}">...</a>
                                            </li>
                                        </c:if>
                                    </c:if>
                                    <li class="${currentIndex == totalPageCount ? 'page-item disabled': 'page-item'}">
                                        <a class="page-link" href=""${baseUrl}${currentIndex + 1}">Sau</a>
                                    </li>
                                    <li class="${currentIndex == totalPageCount ? 'page-item disabled': 'page-item'} ">
                                        <a class="page-link" href="${baseUrl}${totalPageCount}">Cuối</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>
