package com.electronics.controller.admin;

import com.electronics.entity.*;
import com.electronics.service.*;
import com.electronics.service.impl.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "admin")
public class ManagerEnterCouponController {

    @Autowired
    private IEnterCouponService enterCouponService;

    @Autowired
    private ICouponDetailsService couponDetailsService;

    @Autowired
    private SupplierService supplierService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IStaffService staffService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IImageService imageService;

    private void setSupplier(Model model) {
        List<SupplierEntity> supplierList = supplierService.findByOrderByIdDesc();
        if (!supplierList.isEmpty()) {
            Map<Long, String> map = new LinkedHashMap<>();
            for (SupplierEntity supplier : supplierList) {
                map.put(supplier.getId(), supplier.getName());
            }
            model.addAttribute("supplierList", map);
        }
    }

    private void setProduct(Model model) {
        List<ProductEntity> productList = productService.findAllByOrderByIdDesc();
        if (!productList.isEmpty()) {
            Map<Long, String> map = new LinkedHashMap<>();
            for (ProductEntity product : productList) {
                map.put(product.getId(), product.getName());
            }
            model.addAttribute("productList", map);
        }
    }

    @GetMapping("/phieunhap")
    public String enterCoupon_page(Model model) {
        List<EnterCouponEntity> enterCouponList = enterCouponService.findByOrderByIdDesc();
        model.addAttribute("enterCouponList", enterCouponList);
        return "admin/bill/manager_enterCoupon";
    }

    @GetMapping(value = "/phieunhap/them")
    public String add_enter_coupon(Model model) {
        List<CouponDetailsEntity> couponDetailList = couponDetailsService.findByCouponDetailOrderByIdDesc();
        model.addAttribute("coupon", new EnterCouponEntity());
        model.addAttribute("couponDetail", new CouponDetailsEntity());
        model.addAttribute("couponDetailList", couponDetailList);
        setSupplier(model);
        setProduct(model);
        return "admin/bill/add_enter_coupon";
    }

    @PostMapping(value = "/save-enter-coupon")
    public String save_enter_coupon(EnterCouponEntity enterCoupon, Principal principal,
                                    RedirectAttributes redirect) {
        AccountEntity account = accountService.checkUsername(principal.getName());
        StaffEntity staff = staffService.finByAccount_Id(account.getId());
        enterCoupon.setDateAdded(LocalDateTime.now());
        enterCoupon.setStaff(staff);
        enterCoupon.setTotalMoney(0);
        enterCouponService.addEnterCoupon(enterCoupon);
        redirect.addFlashAttribute("success", "Thêm phiếu nhập thành công!");
        return "redirect:/admin/phieunhap";
    }

    @GetMapping(value = "phieunhap/xoa/{id}")
    public String delete_enter_coupon(@PathVariable(value = "id") long id, RedirectAttributes redirect) {
        enterCouponService.deleteEnterCoupon(id);
        redirect.addFlashAttribute("success", "Xoá phiếu nhập thành công!");
        return "redirect:/admin/phieunhap";
    }

    @GetMapping(value = "/phieunhap/capnhat/{id}")
    public String edit_enter_coupon(@PathVariable(value = "id") long id, Model model) {
        EnterCouponEntity enterCoupon = enterCouponService.finByIdEnterCoupon(id);
        List<CouponDetailsEntity> couponDetailList = couponDetailsService.findByEnterCoupon_Id(id);
        model.addAttribute("enterCoupon", enterCoupon);
        model.addAttribute("couponDetail", new CouponDetailsEntity());
        model.addAttribute("couponDetailList", couponDetailList);
        model.addAttribute("imageService", imageService);
        setSupplier(model);
        setProduct(model);
        return "admin/bill/update_enter_coupon";
    }

    @PostMapping(value = "/update-enter-coupon")
    public String update_enter_coupon(EnterCouponEntity enterCoupon, RedirectAttributes redirect,
                                      Principal principal) {
        AccountEntity account = accountService.checkUsername(principal.getName());
        StaffEntity staff = staffService.finByAccount_Id(account.getId());
        enterCoupon.setStaff(staff);
        enterCouponService.addEnterCoupon(enterCoupon);
        redirect.addFlashAttribute("success", "Cập nhật phiếu nhập thành công!");
        return "redirect:/admin/phieunhap";
    }

    @GetMapping(value = "/phieunhap/chitiet/{id}")
    public String edit_coupon_detail(@PathVariable(value = "id") long id, Model model) {
        EnterCouponEntity enterCouponEntities = enterCouponService.finByIdEnterCoupon(id);
        List<CouponDetailsEntity> couponDetailList = couponDetailsService.findByEnterCoupon_Id(id);
        model.addAttribute("enterCoupon", enterCouponEntities);
        model.addAttribute("couponDetailList", couponDetailList);
        model.addAttribute("imageService", imageService);
        return "admin/bill/manager_coupon_detail";
    }

    /********************* chi tiết phiếu nhập ********************************/

    @GetMapping(value = "{id}/themCTPN")
    public String add_couponDetail(@PathVariable(value = "id") long id, Model model) {
        model.addAttribute("couponDetail", new CouponDetailsEntity());
        model.addAttribute("enterCoupon", id);
        setProduct(model);
        return "admin/add_couponDetail";
    }

    @PostMapping(value = "/save-couponDetail/{id}")
    public String save_couponDetail(@PathVariable long id,
                                    CouponDetailsEntity couponDetail,
                                    RedirectAttributes redirect, Model model) {
        EnterCouponEntity enterCoupon = enterCouponService.finByIdEnterCoupon(id);
        CouponDetailsEntity couponDetailsEntity = couponDetailsService.findByProduct_IdAndEnterCoupon_Id(couponDetail.getProduct().getId(), couponDetail.getEnterCoupon().getId());
        if (enterCoupon != null) {
            if (couponDetailsEntity != null) {
                redirect.addFlashAttribute("mes", "Sản phẩm đã tồn tại trong phiếu nhập!");
                return "redirect:/admin/phieunhap/capnhat/{id}";
            } else {
                ProductEntity product = productService.getProductID(couponDetail.getProduct().getId());
                double unitPrice = couponDetail.getQuantity() * product.getPrice();
                couponDetail.setQuantity(couponDetail.getQuantity());
                couponDetail.setUnitPrice(unitPrice);
                couponDetailsService.addCouponDetail(couponDetail);
                enterCoupon.setTotalMoney(enterCoupon.getTotalMoney() + couponDetail.getUnitPrice());
                enterCouponService.addEnterCoupon(enterCoupon);
                redirect.addFlashAttribute("success", "Thêm sản phẩm phiếu nhập thành công!");
                return "redirect:/admin/phieunhap/capnhat/{id}";
            }
        } else {
            model.addAttribute("mes", "Mã phiếu nhập không tồn tại...!");
            model.addAttribute("couponDetail", new CouponDetailsEntity());
            setProduct(model);
            return "admin/add_couponDetail";
        }
    }

    @GetMapping(value = "{idPN}/delete-couponDetail/{id}")
    public String delete_couponDetail(@PathVariable(value = "id") long id,
                                      @PathVariable(value = "idPN") long idPN,
                                      RedirectAttributes redirect) {
        couponDetailsService.deleteACouponDetail(id);
        redirect.addFlashAttribute("success", "Xoá sản phẩm phiếu nhập thành công!");
        return "redirect:/admin/phieunhap/capnhat/{idPN}";
    }

    @GetMapping(value = "/edit-couponDetail/{id}")
    public String edit_couponDetail(@PathVariable(value = "id") long id, Model model) {
        CouponDetailsEntity couponDetail = couponDetailsService.finByIdCouponDetail(id);
        model.addAttribute("couponDetail", couponDetail);
        setProduct(model);
        return "admin/update_couponDetail";
    }

    @PostMapping(value = "{idPN}/update-couponDetail/{id}")
    public String update_couponDetail(@RequestParam(value = "quantity") int quantity,
                                      CouponDetailsEntity couponDetail, RedirectAttributes redirect, Model model) {
        EnterCouponEntity enterCoupon = enterCouponService.finByIdEnterCoupon(couponDetail.getEnterCoupon().getId());
        if (enterCoupon != null) {
            ProductEntity product = productService.getProductID(couponDetail.getProduct().getId());
            double unitPrice = couponDetail.getQuantity() * product.getPrice();
            couponDetail.setUnitPrice(unitPrice);
            couponDetail.setQuantity(quantity);
            couponDetailsService.addCouponDetail(couponDetail);
            enterCoupon.setTotalMoney(enterCoupon.getTotalMoney() + couponDetail.getUnitPrice());
            enterCouponService.addEnterCoupon(enterCoupon);
            redirect.addFlashAttribute("success", "Cập nhật số lượng thành công");
            return "redirect:/admin/manager-couponDetail";
        } else {
            model.addAttribute("mes", "Mã phiếu nhập không tồn tại...!");
            model.addAttribute("couponDetail", couponDetail);
            setProduct(model);
            return "redirect:/admin/phieunhap/capnhat/{id}";
        }
    }
}
