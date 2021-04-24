package com.electronics.controller.web;

import com.electronics.entity.*;
import com.electronics.service.ICategoryService;
import com.electronics.service.IOrderDetailsService;
import com.electronics.service.IOrderService;
import com.electronics.service.impl.AccountService;
import com.electronics.service.impl.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@Scope(value = "session")
@RequestMapping(value = "user")
public class CheckoutOrderAccountController {
    @Autowired
    private Cart cart;

    @Autowired
    private AccountService accountService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IOrderDetailsService orderDetailsService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private JavaMailSender emailSender;

    @GetMapping(value = "/thanhtoan")
    public String checkout(Model model, HttpSession session) {
        List<OrderDetailsEntity> list = cart.getOrderDetailList();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        cart.getOrderDetailList();
        if (!list.isEmpty()) {
            double totalMoney = cart.MoneyTotal();
            int quantityProduct = cart.countItem();
            session.setAttribute("quantityProduct", quantityProduct);
            model.addAttribute("cart", cart);model.addAttribute("totalMoney", totalMoney);
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("order", new OrderEntity());
            return "user/checkout";
        }else {
            return "redirect:/giohang";
        }
    }

    @PostMapping(value = "/checkoutOrderAccount")
    @Transactional(rollbackOn = Exception.class)
    public String checkoutAccount(OrderEntity order, Principal principal, HttpSession session) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        List<OrderDetailsEntity> list = cart.getOrderDetailList();
        if (!list.isEmpty()) {
            order.setDateOfBooking(LocalDateTime.now());
            order.setStaff(null);
            order.setAccount(getAccount);
            order.setStatus("Chưa duyệt");
            order.setTotalMoney(cart.MoneyTotal());
            OrderEntity addOrder = orderService.addOrder(order);
            for (OrderDetailsEntity orderDetails : list) {
                orderDetails.setOrder(addOrder);
                orderDetails.setQuantity(orderDetails.getQuantity());
                orderDetails.setUnitPrice(orderDetails.getMoneyTotal());
                orderDetailsService.addOrderDetail(orderDetails);
            }
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("minhgavn2@gmail.com");
            message.setTo(order.getEmail());
            message.setSubject("Xin chào " + getAccount.getUsername() + " Cảm ơn bạn đã ủng hộ cửa hàng của chúng tôi.");
            message.setText("Các sản phẩm bạn đã mua :\n" + list.toString() + "\n" +
                    "Tổng tiền: " + cart.formatPrice(order.getTotalMoney()) + " VNĐ" + "\n" +
                    "Mọi thắc mắc xin liên hệ qua SĐT: 0964554389");
            emailSender.send(message);
            cart.emptyCart(list);
            session.setAttribute("quantityProduct", cart.countItem());
            return "redirect:/user/lichsumuahang";
        } else {
            return "redirect:/giohang";
        }

    }
}
