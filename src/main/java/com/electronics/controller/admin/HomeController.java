package com.electronics.controller.admin;

import com.electronics.service.IAccountService;
import com.electronics.service.ICommentService;
import com.electronics.service.IOrderService;
import com.electronics.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "homeControllerofAdmin")
@RequestMapping("admin")
public class HomeController {
    @Autowired
    IProductService iProductService;
    @Autowired
    IOrderService iOrderService;
    @Autowired
    IAccountService iAccountService;
    @Autowired
    ICommentService iCommentService;

    @GetMapping(value = {"/trangchu", "/"})
    public String homePage(Model model) {
        model.addAttribute("doanhthu",iOrderService.sumMoney());
        model.addAttribute("binhluan",iCommentService.findAll());
        model.addAttribute("nguoidung",iAccountService.findByOrderByIdDesc());
        model.addAttribute("donhang",iOrderService.findAll());
        model.addAttribute("data", iProductService.statisticsProduct());
        model.addAttribute("data1", iOrderService.revenueByWeek());
        model.addAttribute("listOut", iProductService.outOfStock());
        return "admin/index";
    }
}
