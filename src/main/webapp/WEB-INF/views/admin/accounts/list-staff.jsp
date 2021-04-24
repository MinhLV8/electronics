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
<h3 class="mt-4">Quản lý nhân viên - ${staffList.pageList.size()} nhân viên</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý nhân viên</li>
</ol>
<div class="main-content-inner">
    <div class="card mb-4 shadow p-3 mb-5">
        <div class="card-body">
            <div class="d-flex bd-highlight">
                <div class="p-2 flex-grow-1 bd-highlight">
                    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                        <div class="btn-group mr-2" role="group" aria-label="First group">
                            <a class="btn btn-primary" href="/admin/nhanvien/them"><i class="fas fa-plus"></i>
                                Thêm mới
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="float-none">&nbsp;</div>
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-items-center"
                           style="text-align: center;" id="dataTables-example">
                        <thead class="thead-light">
                        <tr>
                            <th style="width: 50px;vertical-align: middle;">Id</th>
                            <th style="width: 50px;vertical-align: middle;">Họ và tên</th>
                            <th style="width: 100px;vertical-align: middle;">Số điện thoại</th>
                            <th style="width: 100px;vertical-align: middle;">Địa chỉ</th>
                            <th style="width: 100px;">Chức vụ</th>
                            <th style="width: 100px;">Tài khoản</th>
                            <th style="width: 90px">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="staff" items="${staffList.pageList}">
                            <tr>
                                <td>${staff.id}</td>
                                <td class="align-middle"><p>${staff.account.name}</p></td>
                                <td class="align-middle">${staff.phone}</td>
                                <td class="align-middle">${staff.address}</td>
                                <td class="align-middle">${staff.position}</td>
                                <td class="align-middle">${staff.account.username}</td>
                                <td class="align-middle" style="text-align: center;">
                                    <a class="btn btn-primary btn-sm" href="/admin/nhanvien/capnhat/${staff.id}">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a class="btn btn-danger btn-sm" href="/admin/nhanvien/xoa/${staff.id}">
                                        <i class="fa fa-trash"></i>
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
