package com.electronics.controller.admin;

import com.electronics.entity.*;
import com.electronics.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping(value = "admin")
public class ManagerOrderController {
    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailsService orderDetailsService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IStaffService staffService;

    @Autowired
    private IProductService productService;

    private String[] status = {"Thành công", "Chưa duyệt", "Đã duyệt", "Thất bại","Đã hủy"};

    @GetMapping("/donhang")
    public String order_page(Model model) {
        List<OrderEntity> orderList = orderService.findByDateOfBookingDesc();
        model.addAttribute("orderList", orderList);
        return "admin/order/manager_order";
    }

    @GetMapping(value = "/edit-order/{id}")
    public String edit_order(@PathVariable(value = "id") Long id, Model model) {
        OrderEntity order = orderService.findById(id);
        List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(id);
        model.addAttribute("orderDetailList", orderDetailList);
        model.addAttribute("order", order);
        model.addAttribute("status", status);
        return "admin/order/update_order";
    }

    @PostMapping(value = "/update-order")
    public String update_order(OrderEntity order, RedirectAttributes redirect,
                               Principal principal) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        StaffEntity staff = staffService.finByAccount_Id(getAccount.getId());
        OrderEntity getOrder = orderService.findById(order.getId());
        // tang so luong san pham khi giao hang thất bại
        if (order.getStatus().equals("Thất bại")) {
            List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(getOrder.getId());
            for (int i = 0; i < orderDetailList.size(); i++) {
                ProductEntity product = productService.getProductID(orderDetailList.get(i).getProduct().getId());
                if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                    product.setQuantity(product.getQuantity() + orderDetailList.get(i).getQuantity());
                    productService.addProduct(product);
                }
            }
            getOrder.setStaff(staff);
            getOrder.setName(order.getName());
            getOrder.setPhone(order.getPhone());
            getOrder.setAddress(order.getAddress());
            getOrder.setStatus(order.getStatus());
            orderService.addOrder(getOrder);
            redirect.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:/admin/donhang";
        } else {
            getOrder.setStaff(staff);
            getOrder.setName(order.getName());
            getOrder.setPhone(order.getPhone());
            getOrder.setAddress(order.getAddress());
            getOrder.setStatus(order.getStatus());
            orderService.addOrder(getOrder);
            redirect.addFlashAttribute("success", "Cập nhật đơn hàng thành công!");
            return "redirect:/admin/donhang";
        }
    }

    @GetMapping(value = "/edit-orderDetail/{id}")
    public String edit_orderDetail(@PathVariable(value = "id") Long id, Model model) {
        List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(id);
        model.addAttribute("orderDetailList", orderDetailList);
        return "admin/order/order-detail";
    }
}
