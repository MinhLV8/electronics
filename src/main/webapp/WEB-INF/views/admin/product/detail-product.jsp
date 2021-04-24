<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglib.jsp" %>
<%@ include file="/includes/admin/header.jsp" %>
<%@ include file="/includes/admin/leftbar.jsp" %>
<div class="container m-b-30">
    <div class="row">
        <div class="col-12 text-black p-t-40 p-b-90">
            <h1 class="mt-4">Chi tiết sản phẩm</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><i class="ace-icon fa fa-home home-icon"></i> Trang chủ</li>
                <li class="breadcrumb-item">Quản lý sản phẩm</li>
                <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
            </ol>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row justify-content-md-center">
        <div class="card rounded-lg shadow p-3 mb-5 col-sm-6">
            <div class="card-body">
                <h3>${getProductID.name}</h3>
                <div class="text-center">
                    <img class="rounded" src="/getImage/${imageService.urlImage(getProductID.id).url}">
                </div>
                <h5 class="text-danger"><strong>Thông tin chung:</strong></h5>
                <table class="table table-responsive-lg">
                    <tbody>
                    <tr>
                        <td class="font-weight-bold">Tên sản phẩm:</td>
                        <td>${getProductID.name}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Giá:</td>
                        <td><fmt:formatNumber type="number" pattern="###,###,###" value="${getProductID.price}"/> ₫</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Số lượng:</td>
                        <td>${getProductID.quantity}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Thương hiệu</td>
                        <td>${getProductID.brand.name}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Thể loại:</td>
                        <td>${getProductID.category.name}</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-danger font-weight-bold h5">Thông tin chi tiết:</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Hệ điều hành:</td>
                        <td>${productInfomation.oS}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Màu sắc:</td>
                        <td>${productInfomation.color}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">CPU:</td>
                        <td>${productInfomation.cpu}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Card đồ hoạ:</td>
                        <td>${productInfomation.gpu}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Màn hình:</td>
                        <td style="width:70%">${productInfomation.display}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Ổ cứng:</td>
                        <td>${productInfomation.memory}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">RAM:</td>
                        <td>${productInfomation.ram}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Pin:</td>
                        <td>${productInfomation.pin}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Kích thước:</td>
                        <td>${productInfomation.size}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Thiết kế:</td>
                        <td>${productInfomation.design}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Camera:</td>
                        <td>${productInfomation.camera}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Camera phụ:</td>
                        <td>${productInfomation.frontCamera}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Kết nối không dây:</td>
                        <td>${productInfomation.wC}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Cổng kết nối:</td>
                        <td>${productInfomation.connector}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Phụ kiện đi kèm:</td>
                        <td>${productInfomation.accessories}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Bảo hành:</td>
                        <td>${productInfomation.guarantee}</td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold">Thời gian ra mắt:</td>
                        <td>${productInfomation.timeOfLaunch}</td>
                    </tr>
                    </tbody>
                </table>
                <a class="btn btn-info text-white" href="/admin/sanpham/capnhat/${getProductID.id}"><i
                        class="fa fa-edit"></i> Sửa thông tin</a>
                <a class="btn btn-dark text-white" href="/admin/sanpham"><i class="fa fa-undo-alt"></i> Quay lại</a>
            </div>
        </div>
    </div>
</div>
</main>
<%@ include file="/includes/admin/footer.jsp" %>