package com.electronics.controller.admin;

import com.electronics.entity.BrandEntity;
import com.electronics.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "admin")
public class ManagerBrandController {
    @Autowired
    private IBrandService brandService;

    @GetMapping(value = {"/thuonghieu/danhsach", "/thuonghieu"})
    public String brandPage(Model model) {
        List<BrandEntity> page = brandService.findAllOrderByIdDesc();
        model.addAttribute("brandList", page);
        return "admin/brand/list";
    }

    @GetMapping(value = "/thuonghieu/them")
    public String addBrand(Model model) {
        model.addAttribute("brand", new BrandEntity());
        return "admin/brand/add";
    }

    @PostMapping(value = "/save-brand")
    public String saveBrand(BrandEntity brand, RedirectAttributes redirect) {
        brandService.addBrand(brand);
        redirect.addFlashAttribute("success", "Thêm thương hiệu thành công!");
        return "redirect:/admin/thuonghieu";
    }

    @PostMapping(value = "/save-update-brand")
    public String saveBrandUpdate(BrandEntity brand, RedirectAttributes redirect) {
        brandService.addBrand(brand);
        redirect.addFlashAttribute("success", "Cập nhật thương hiệu thành công!");
        return "redirect:/admin/thuonghieu";
    }

    @GetMapping(value = "/thuonghieu/xoa/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteBrand(@PathVariable(value = "id") long id, RedirectAttributes redirect) {
        brandService.deleteBrand(id);
        redirect.addFlashAttribute("success", "Xoá thương hiệu thành công!");
        return "redirect:/admin/thuonghieu/danhsach";
    }

    @GetMapping(value = "/thuonghieu/capnhat/{id}")
    public String updateBrand(@PathVariable(value = "id") long id, Model model) {
        BrandEntity brand = brandService.findByBrandID(id);
        model.addAttribute("brand", brand);
        return "admin/brand/update";
    }
}
