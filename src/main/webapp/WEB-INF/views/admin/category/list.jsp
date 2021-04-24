<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07/13/2020
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Loại sản phẩm</title>
</head>
<body>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Loại sản phẩm - ${categoryList.pageSize} loại</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý loại sản phẩm</li>
</ol>
<div class="main-content-inner">
    <c:if test="${not empty message}">
        <script type="text/javascript">
            $(document).ready(function () {
                ${message}
            });
        </script>
    </c:if>
    <div class="row justify-content-md-center row-cols-2">
        <div class="card mb-4 shadow p-3 mb-5">
            <div class="card-body">
                <div class="d-flex bd-highlight">
                    <div class="p-2 flex-grow-1 bd-highlight">
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group mr-2" role="group" aria-label="First group">
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#exampleModal"><i class="fas fa-plus"></i>
                                    Thêm mới
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="p-2 bd-highlight">
                        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                            <div class="btn-group mr-2" role="group" aria-label="First group">
                                <div class="input-group flex-nowrap">
                                    <form action="/admin/search-category/page/1" method="post">
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="search" required
                                                   aria-label="Search" aria-describedby="basic-addon2" >
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="float-none">&nbsp;</div>
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-hover border border-gray align-items-center"
                               style="text-align: center;" id="tblData">
                            <thead class="thead-light">
                            <tr>
                                <th>Id</th>
                                <th style="width: 50%;">Tên loại</th>
                                <th style="width: 220px;">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="category" items="${categoryList.pageList}">
                                <tr>
                                    <td class="align-middle">${category.id}</td>
                                    <td class="align-middle">
                                            ${category.name}
                                    </td>
                                    <td class="align-middle" style="text-align: center;">
                                        <a class="btn btn-primary btn-sm"
                                           href="/admin/theloai/capnhat/${category.id}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm" href="/admin/theloai/xoa/${category.id}">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <hr class="my-4">
                        <div class="d-flex align-items-sm-start bd-highlight">
                            <div class="p-2 flex-grow-1 bd-highlight">Hiển thị ${currentIndex} của
                                ${totalPageCount} trang
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</main>
<%--modal them--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm mới</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/admin/save-category" id="formInput">
                    <div class="form-row">
                        <label>Tên thể loại</label>
                        <input type="text" class="form-control" required="true" name="name" id="name"/>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary"><i class="far fa-edit"></i> Lưu
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/includes/admin/footer.jsp" %>
</body>
</html>