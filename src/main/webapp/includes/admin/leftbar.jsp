<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 09/12/2020
  Time: 11:00 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" %>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_STAFF')">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="/admin/trangchu">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Trang chủ</a>
                            <a class="nav-link" href="/trangchu">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Website người dùng</a>
                            <div class="sb-sidenav-menu-heading">Chức năng</div>
                            <%--Đơn hàng--%>
                            <a class="nav-link" href="/admin/donhang"><i class="fas fa-file-invoice-dollar"></i>&nbsp
                                Đơn hàng</a>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts"
                               aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-dolly-flatbed"></i></div>
                                Sản phẩm
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                 data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/sanpham"><i class="fas fa-caret-right"></i>&nbsp
                                        QL sản phẩm</a>
                                    <a class="nav-link" href="/admin/theloai"><i class="fas fa-caret-right"></i>&nbsp
                                        QL thể loại</a>
                                    <a class="nav-link" href="/admin/thuonghieu"><i class="fas fa-caret-right"></i>&nbsp
                                        QL thương hiệu</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="/admin/hinhanh">
                                <div class="sb-nav-link-icon"><i class="fas fa-image"></i></div>
                                Quản lý hình ảnh</a>
                            <%--khuyến mãi--%>
                            <a class="nav-link" href="/admin/khuyenmai"><i class="fas fa-percent"></i>&nbsp
                                Khuyến mãi</a>
                            <%--khuyến mãi end--%>
                            <%--Phiếu nhập--%>
                            <a class="nav-link" href="/admin/phieunhap"><i class="fas fa-file-signature"></i>&nbsp
                                Phiếu nhập</a>
                            <a class="nav-link" href="/admin/nhacungcap">
                                <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                                Nhà cung cấp</a>
                            <div class="sb-sidenav-menu-heading">Thống kê</div>
                            <%--Thống kê--%>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#khuyenmai"
                               aria-expanded="false" aria-controls="khuyenmai">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div>
                                Thống kê tồn kho
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="khuyenmai" aria-labelledby="headingOne"
                                 data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/tonkho/theoloai"><i class="fas fa-caret-right"></i>&nbsp
                                        Tồn kho theo loại</a>
                                    <a class="nav-link" href="/admin/tonkho/theoth"><i class="fas fa-caret-right"></i>&nbsp
                                        Theo thương hiệu</a>
                                    <a class="nav-link" href="/admin/tonkho/theosp"><i class="fas fa-caret-right"></i>&nbsp
                                        Theo sản phẩm</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#doanhthu"
                               aria-expanded="false" aria-controls="doanhthu">
                                <div class="sb-nav-link-icon"><i class="fas fa-coins"></i></div>
                                Doanh thu
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="doanhthu" aria-labelledby="headingOne"
                                 data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/doanhthu/theloai"><i
                                            class="fas fa-caret-right"></i>&nbsp
                                        Theo loại SP</a>
                                    <a class="nav-link" href="/admin/doanhthu/khachhang"><i
                                            class="fas fa-caret-right"></i>&nbsp
                                        Theo khách hàng</a>
                                    <a class="nav-link" href="/admin/doanhthu/thang"><i class="fas fa-caret-right"></i>&nbsp
                                        Theo tháng</a>
                                    <a class="nav-link" href="/admin/doanhthu/quy"><i class="fas fa-caret-right"></i>&nbsp
                                        Theo quý</a>
                                    <a class="nav-link" href="/admin/doanhthu/nam"><i class="fas fa-caret-right"></i>&nbsp
                                        Theo năm</a>
                                </nav>
                            </div>
                        </sec:authorize>
                    </sec:authorize>
                    <%--khuyến mãi end--%>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <div class="sb-sidenav-menu-heading">Hệ thống</div>
                            <a class="nav-link" href="/admin/taikhoan">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Tài khoản</a>
                            <a class="nav-link" href="/admin/nhanvien">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                Nhân viên</a>
                        </sec:authorize>
                    </sec:authorize>
                </div>
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        $('#dataTables-example').DataTable({
                            responsive: true,
                            "language": {
                                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Vietnamese.json"
                            }
                        });
                    });
                </script>