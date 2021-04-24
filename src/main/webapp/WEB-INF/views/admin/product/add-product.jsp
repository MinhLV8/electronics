<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<html>
<head>
    <style type="text/css">
        .thumb-image{
            float: left;
            width: 100px;
            position: relative;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-12 p-t-40 p-b-90">
        <h1 class="mt-4">Thêm sản phẩm</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
            <li class="breadcrumb-item">Quản lý sản phẩm</li>
            <li class="breadcrumb-item active">Thêm sản phẩm</li>
        </ol>
    </div>
</div>
<div class="container-fluid">
    <c:if test="${not empty mes}">
        <script type="text/javascript">
            Swal.fire({
                icon: 'success',
                title: '${mes}',
                showConfirmButton: false,
                timer: 1500
            })
        </script>
    </c:if>
    <script>
        /*function previewFile(input){
            var file = $("input[type=file]").get(0).files[0];
            if(file){
                var reader = new FileReader();
                reader.onload = function(){
                    $("#previewImg").attr("src", reader.result);
                }
                reader.readAsDataURL(file);
            }
        }*/
        jQuery(document).ready(function($) {
            $("#fileUpload").on('change', function() {
                //Get count of selected files
                var countFiles = $(this)[0].files.length;
                var imgPath = $(this)[0].value;
                var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                var image_holder = $("#image-holder");
                image_holder.empty();
                if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                    if (typeof(FileReader) != "undefined") {
                        //loop for each file selected for uploaded.
                        for (var i = 0; i < countFiles; i++)
                        {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                                $("<img />", {
                                    "src": e.target.result,
                                    "class": "thumb-image",
                                    "style": "width:280px"
                                }).appendTo(image_holder);
                            }
                            image_holder.show();
                            reader.readAsDataURL($(this)[0].files[i]);
                        }
                    } else {
                        alert("Trình duyệt này không hỗ trợ FileReader.");
                    }
                } else {
                    alert("Vui lòng chỉ chọn hình ảnh");
                }
            });
        });
    </script>
    <div class="col-lg-12">
        <div class="card shadow">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <form:form modelAttribute="product" method="post" action="/admin/save" enctype="multipart/form-data">
                            <form:input path="id" type="hidden" class="form-control"/>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Tên sản phẩm: <span class="text-danger font-weight-bold">(*)</span></label>
                                    <form:input type="text" class="form-control" path="name"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Cpu</label>
                                    <form:input type="text" class="form-control" path="productInformation.cpu"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label>Số lượng <span class="text-danger font-weight-bold">(*)</span></label>
                                    <form:input type="number" class="form-control" path="quantity" readonly="true"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Giá <span class="text-danger font-weight-bold">(*)</span></label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="money form-control"
                                                    required="on" maxlength="12" autocomplete="off" name="prices"/>
                                        <div class="input-group-append">
                                            <label class="input-group-text">₫</label>
                                        </div>
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
                                    <label>Thương hiệu <span class="text-danger font-weight-bold">(*)</span></label>
                                    <form:select path="brand" class="form-control">
                                        <form:options items="${brandList}"/>
                                    </form:select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Loại sản phẩm <span class="text-danger font-weight-bold">(*)</span></label>
                                    <form:select path="category" class="form-control">
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
                                    <label>Hình ảnh <span class="text-danger font-weight-bold">(*)</span></label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="image" multiple id="fileUpload"
                                               accept="image/png, image/jpeg" onchange="previewFile(this);
                                       this.nextElementSibling.innerText = this.files[0].name">
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
                                    <%--<img class="img-thumbnail" id="previewImg">--%>
                                    <div id="image-holder"></div>
                                </div>
                                <div class="col">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Pin</label>
                                            <form:input type="text" class="form-control" path="productInformation.pin"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Thời gian ra mắt</label>
                                            <form:input type="text" class="form-control" path="productInformation.timeOfLaunch"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Camera trước</label>
                                            <form:input type="text" class="form-control" path="productInformation.camera"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Camera sau</label>
                                            <form:input type="text" class="form-control" path="productInformation.frontCamera"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Cổng kết nối/ cổng sạc</label>
                                            <form:input type="text" class="form-control" path="productInformation.connector"/>
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
                                            <form:input type="text" class="form-control" path="productInformation.design"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Kích thước</label>
                                            <form:input type="text" class="form-control" path="productInformation.size"/>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Phụ kiện đi kèm</label>
                                            <form:input type="text" class="form-control" path="productInformation.accessories"/>
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
                            <button type="sumit" class="btn btn-success"><i class="fas fa-save"></i> Lưu lại</button>
                            &nbsp;
                            <button type="reset" class="btn btn-warning"><i class="fas fa-undo-alt"></i> Nhập lại
                            </button>
                            &nbsp;
                            <a href="${pageContext.request.contextPath}/admin/sanpham" class="btn btn-dark"><i class="fas fa-arrow-left"></i> Quay lại
                            </a>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<script type="text/javascript">
    $(document).ready(function() {
        var editor = '';
        editor = CKEDITOR.replace('content',{
            height: 1000
        });
        CKFinder.setupCKEditor( editor );

    });
    $('.money').simpleMoneyFormat();
</script>
<%@ include file="/includes/admin/footer.jsp" %>
</body>
