<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="row">
    <div class="col-12 p-t-40 p-b-90">
        <h1 class="mt-4">Chỉnh sửa sản phẩm</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
            <li class="breadcrumb-item">Quản lý sản phẩm</li>
            <li class="breadcrumb-item active">Cập nhật sản phẩm</li>
        </ol>
    </div>
</div>
<script>
    function previewFile(input) {
        var file = $("input[type=file]").get(0).files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function () {
                $("#previewImg").attr("src", reader.result);
            }
            reader.readAsDataURL(file);
        }
    }
</script>
<div class="container-fluid">
    <div class="col-lg-12">
        <div class="card shadow">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <form:form modelAttribute="getProductID" method="post" action="/admin/save-update-product"
                                   enctype="multipart/form-data">
                            <form:input path="id" type="hidden" class="form-control"/>
                            <form:input path="createdDate" type="hidden" class="form-control"/>
                            <form:input path="productInformation.id" type="hidden" cssClass="form-control"/>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Tên sản phẩm</label>
                                    <form:input type="text" class="form-control" path="name"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Cpu</label>
                                    <form:input type="text" class="form-control" path="productInformation.cpu"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Số lượng</label>
                                    <form:input type="number" class="form-control" path="quantity" readonly="true"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Giá</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control money"
                                               value="<fmt:formatNumber type="number" pattern="###" value="${getProductID.price}"/>"
                                               required="on" maxlength="15" autocomplete="off" name="prices">
                                        <div class="input-group-append">
                                            <span class="input-group-text"> ₫</span>
                                        </div>
                                        <script type="text/javascript">
                                            $('.money').simpleMoneyFormat();
                                        </script>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Card màn hình</label>
                                    <form:input type="text" class="form-control" path="productInformation.gpu"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Màu sắc</label>
                                    <form:input type="text" class="form-control" path="productInformation.color"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Bảo hành</label>
                                    <form:input type="text" class="form-control" path="productInformation.guarantee"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Hệ điều hành</label>
                                    <form:input type="text" class="form-control" path="productInformation.oS"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Thương hiệu</label>
                                    <form:select path="brand.id" class="form-control">
                                        <form:options items="${brandList}"/>
                                    </form:select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Loại sản phẩm</label>
                                    <form:select path="category.id" class="form-control">
                                        <form:options items="${categoryList}"/>
                                    </form:select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Màn hình</label>
                                    <form:input type="text" class="form-control" path="productInformation.display"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Hình ảnh</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="image_file"
                                               accept="image/png, image/jpeg" multiple <%--onchange="previewFile(this);
                                               this.nextElementSibling.innerText = this.files[0].name"--%>>
                                        <label class="custom-file-label">Chọn hình ảnh...</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Bộ nhớ</label>
                                    <form:input type="text" class="form-control" path="productInformation.memory"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Ram</label>
                                    <form:input type="text" class="form-control" path="productInformation.ram"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <div id="image-holder"></div>
                                    <img class="img-thumbnail" src="/getImage/${imageService.urlImage(getProductID.id).url}" id="previewImg">
                                </div>
                                <div class="col">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Pin</label>
                                            <form:input type="text" class="form-control" path="productInformation.pin"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Thời gian ra mắt</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.timeOfLaunch"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Camera trước</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.camera"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Camera sau</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.frontCamera"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Cổng kết nối/ cổng sạc</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.connector"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Kết nối không dây</label>
                                            <form:input type="text" class="form-control" path="productInformation.wC"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Thiết kế</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.design"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Kích thước</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.size"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Phụ kiện đi kèm</label>
                                            <form:input type="text" class="form-control"
                                                        path="productInformation.accessories"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <form:textarea id="content" name="content" class="form-control"
                                               aria-label="With textarea"
                                               path="productInformation.description"/>
                            </div>
                            <form:input type="hidden" path="productInformation.product.id"/>
                            <button type="sumit" class="btn btn-success"><i class="fas fa-save"></i> Lưu lại</button>
                            &nbsp;
                            <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại
                            </button>
                            &nbsp;
                            <a href="${pageContext.request.contextPath}/admin/sanpham" class="btn btn-dark"><i
                                    class="fas fa-arrow-left"></i> Quay lại
                            </a>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<script type="text/javascript">
    $(document).ready(function () {
        var editor = '';
        editor = CKEDITOR.replace('content', {
            height: 1000
        });
    });
</script>
<%@ include file="/includes/admin/footer.jsp" %>
