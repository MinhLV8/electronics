package com.electronics.controller.admin;

import com.electronics.entity.SupplierEntity;
import com.electronics.service.impl.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "admin")
public class ManagerSupplierController {
    @Autowired
    private SupplierService supplierService;

    @GetMapping(value = {"/nhacungcap/danhsach","/nhacungcap"})
    public String supplierListPage(Model model){
        List<SupplierEntity> supplierList = supplierService.findByOrderByIdDesc();
        model.addAttribute("supplierList", supplierList);
        return "admin/supplier/manager_supplier";
    }
    @GetMapping(value = "/nhacungcap/them")
    public String addSupplier(Model model){
        model.addAttribute("supplier", new SupplierEntity());
        return "admin/supplier/add_supplier";
    }

    @PostMapping(value = "/save-supplier")
    public String save_supplier(SupplierEntity supplier, RedirectAttributes redirect){
        supplierService.addSupplier(supplier);
        redirect.addFlashAttribute("success","Thêm thành công!");
        return "redirect:/admin/nhacungcap";
    }

    @GetMapping(value = "/nhacungcap/capnhat/{id}")
    public String edit_supplier(@PathVariable(value = "id") long id, Model model){
        SupplierEntity supplier = supplierService.findByID(id);
        model.addAttribute("supplier", supplier);
        return "admin/supplier/update_supplier";
    }

    @PostMapping(value = "/update-supplier")
    public String update_supplier(SupplierEntity supplier, RedirectAttributes redirect){
        supplierService.addSupplier(supplier);
        redirect.addFlashAttribute("success","Cập nhật thành công!");
        return "redirect:/admin/nhacungcap";
    }

    @GetMapping(value = "/nhacungcap/xoa/{id}")
    public String delete_supplier(@PathVariable(value = "id") long id,
                                  RedirectAttributes redirect){
        supplierService.deleteSupplier(id);
        redirect.addFlashAttribute("success","Xoá thành công");
        return "redirect:/admin/nhacungcap";
    }
}
