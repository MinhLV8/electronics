<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<h3 class="mt-4">Sản phẩm - Có ${productList.size()} sản phẩm</h3>
<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
    <li class="breadcrumb-item active"> Quản lý sản phẩm</li>
</ol>
<div class="main-content-inner">
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
    <div class="d-flex bd-highlight">
        <div class="p-2 flex-grow-1 bd-highlight">
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <a class="btn btn-primary" data-toggle="tooltip"
                       href='${pageContext.request.contextPath}/admin/sanpham/them'>
                        <i class="fas fa-plus"></i>
                        Thêm sản phẩm mới
                    </a>
                </div>
                <%--<div class="btn-group mr-2" role="group" aria-label="Second group">
                    <a class="btn btn-info" href='#'>
                        <i class="fas fa-plus"></i>
                        Thêm loại sp
                    </a>
                </div>
                <div class="btn-group mr-2" role="group" aria-label="Second group">
                    <a class="btn btn-info" href='#'>
                        <i class="fas fa-plus"></i>
                        Thêm thương hiệu
                    </a>
                </div>--%>
            </div>
        </div>
        <%--<div class="p-2 bd-highlight">
            <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <div class="input-group flex-nowrap">
                        <form action="/admin/sanpham-search/page/1" method="post">
                            <div class="input-group">
                                <input class="form-control" type="text" name="search" required
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
    <div class="float-none">&nbsp;</div>
    <div class="card mb-4 rounded-lg">
        <div class="card-header"><i class="fas fa-table mr-1"></i>Danh sách sản phẩm sắp hết hàng</div>
            <div class="card-body">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered rounded-lg" id="dataTables-example">
                            <thead class="thead-light">
                            <tr class="text-center">
                                <th>No.</th>
                                <th>Tên sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Th/hiệu</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Thể loại</th>
                                <th>Ngày thêm</th>
                                <th>Sửa lần cuối</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${productList}" varStatus="i">
                                <tr class="text-center">
                                    <td>${i.index +1}</td>
                                    <td class="align-middle"><a class="text-dark" data-toggle="modal"
                                                                data-target="#exampleModal${product.id}"
                                                                href="/admin/sanpham/chitiet/${product.id}">${product.name}</a>
                                    </td>
                                    <td class="align-middle">
                                        <img class="img-thumbnail" style="width: 60px;"
                                             src="/getImage/${imageService.urlImage(product.id).url}" alt="">
                                    </td>
                                    <td class="align-middle">${product.brand.name}</td>
                                    <c:choose>
                                        <c:when test="${product.quantity <=10}">
                                            <td class="align-middle">
                                                <p class="font-weight-bold text-danger">${product.quantity}</p></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="align-middle">
                                                <p class="font-weight-bold text-success">${product.quantity}</p></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td class="align-middle">${product.formatPrice()} ₫
                                            <%--<fmt:formatNumber type="number" pattern="###,###,###" value="${product.price}"/> ₫--%>
                                    </td>
                                    <td class="align-middle">${product.category.name}</td>
                                        <%-- <td  class="align-middle"><span class="badge badge-success"><i class="fas fa-check"></i></span></td>--%>
                                    <td class="align-middle">${product.formatCreatedDate()}</td>
                                    <td class="align-middle">${product.formatModifiedDate()}</td>
                                    <td class="align-middle" style="text-align: center;">
                                            <%--<a class="btn btn-info btn-sm" href="/admin/sanpham/chitiet/${product.id}">
                                                <i class="fa fa-eye"></i>
                                            </a>--%>
                                        <a class="btn btn-info btn-sm rounded-lg" href="/admin/sanpham/capnhat/${product.id}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a class="btn btn-danger btn-sm rounded-lg" href="/admin/sanpham/xoa/${product.id}">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal${product.id}" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Sản
                                                    phẩm ${product.name}</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <img style="width: 18rem"
                                                         src="/getImage/${imageService.urlImage(product.id).url}"
                                                         alt="">
                                                </div>
                                                <dl class="row">
                                                    <dt class="col-sm-3">Hệ điều hành:</dt>
                                                    <dd class="col-sm-9">${product.productInformation.oS}</dd>
                                                    <dt class="col-sm-3">Màu sắc:</dt>
                                                    <dd class="col-sm-9">${product.productInformation.color}</dd>
                                                    <dt class="col-sm-3">CPU:</dt>
                                                    <dd class="col-sm-9">${product.productInformation.cpu}</dd>
                                                    <dt class="col-sm-3">GPu</dt>
                                                    <dd class="col-sm-9">${product.productInformation.gpu}</dd>
                                                    <dt class="col-sm-3">Màn hình</dt>
                                                    <dd class="col-sm-9">${product.productInformation.display}</dd>
                                                    <dt class="col-sm-3">Bộ nhớ</dt>
                                                    <dd class="col-sm-9">${product.productInformation.memory}</dd>
                                                    <dt class="col-sm-3">Ram</dt>
                                                    <dd class="col-sm-9">${product.productInformation.ram}</dd>
                                                    <dt class="col-sm-3">Pin</dt>
                                                    <dd class="col-sm-9">${product.productInformation.pin}</dd>
                                                    <dt class="col-sm-3">Kích thước</dt>
                                                    <dd class="col-sm-9">${product.productInformation.size}</dd>
                                                    <dt class="col-sm-3">Thiết kế</dt>
                                                    <dd class="col-sm-9">${product.productInformation.design}</dd>
                                                    <dt class="col-sm-3">Camera</dt>
                                                    <dd class="col-sm-9">${product.productInformation.camera}</dd>
                                                    <dt class="col-sm-3">Camera phụ</dt>
                                                    <dd class="col-sm-9">${product.productInformation.frontCamera}</dd>
                                                    <dt class="col-sm-3">Kết nối không dây</dt>
                                                    <dd class="col-sm-9">${product.productInformation.wC}</dd>
                                                    <dt class="col-sm-3">Cổng kết nối, sạc</dt>
                                                    <dd class="col-sm-9">${product.productInformation.connector}</dd>
                                                    <dt class="col-sm-3">Phụ kiện</dt>
                                                    <dd class="col-sm-9">${product.productInformation.accessories}</dd>
                                                    <dt class="col-sm-3">Bảo hành</dt>
                                                    <dd class="col-sm-9">${product.productInformation.guarantee}</dd>
                                                    <dt class="col-sm-3">Thời gian ra mắt</dt>
                                                    <dd class="col-sm-9">${product.productInformation.timeOfLaunch}</dd>
                                                </dl>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    <i class="fa fa-times"></i> Đóng
                                                </button>
                                                <a class="btn btn-info text-white"
                                                   href="/admin/sanpham/capnhat/${product.id}"><i
                                                        class="fa fa-edit"></i> Sửa thông tin</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>