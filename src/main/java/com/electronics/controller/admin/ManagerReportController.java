package com.electronics.controller.admin;

import com.electronics.service.IOrderDetailsService;
import com.electronics.service.IOrderService;
import com.electronics.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "admin")
public class ManagerReportController {

    @Autowired
    private IProductService iProductService;

    @Autowired
    private IOrderDetailsService iOrderDetailsService;

    @Autowired
    private IOrderService iOrderService;

    @RequestMapping("/tonkho/theoloai")
    public String inventoryCat(Model model) {
        model.addAttribute("data", iProductService.inventoryCat());
        return "admin/report/inventory";
    }

    @RequestMapping("/tonkho/theoth")
    public String inventoryBrand(Model model) {
        model.addAttribute("data", iProductService.inventoryBrand());
        return "admin/report/inventory";
    }

    @RequestMapping("/tonkho/theosp")
    public String revenueByProduct(Model model) {
        model.addAttribute("data", iProductService.inventoryProduct());
        return "admin/report/inventory";
    }

    @RequestMapping("/doanhthu/theloai")
    public String revenueByCategory(Model model) {
        model.addAttribute("data", iOrderDetailsService.revenueByCategory());
        return "admin/report/revenue-by-category";
    }

    @RequestMapping("/doanhthu/khachhang")
    public String revenueByCustomer(Model model) {
        model.addAttribute("data", iOrderService.revenueByCustomer());
        return "admin/report/revenue-by-customer";
    }

    @RequestMapping("/doanhthu/nam")
    public String revenueByYear(Model model) {
        model.addAttribute("data", iOrderService.revenueByYear());
        return "admin/report/revenue-by-year";
    }

    @RequestMapping("/doanhthu/quy")
    public String revenueByQuarter(Model model) {
        model.addAttribute("data", iOrderService.revenueByQuarter());
        return "admin/report/revenue-by-quarter";
    }

    @RequestMapping("/doanhthu/thang")
    public String revenueByMonth(Model model) {
        model.addAttribute("data", iOrderService.revenueByMonth());
        return "admin/report/revenue-by-month";
    }
}
