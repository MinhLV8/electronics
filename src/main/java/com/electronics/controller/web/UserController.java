package com.electronics.controller.web;

import com.electronics.entity.*;
import com.electronics.service.IOrderDetailsService;
import com.electronics.service.IOrderService;
import com.electronics.service.IProductService;
import com.electronics.service.TestInput;
import com.electronics.service.impl.AccountService;
import com.electronics.service.impl.Check_EmailService;
import com.electronics.service.impl.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController {
    private final TestInput testInput = new TestInput();
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderDetailsService orderDetailsService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    private IProductService productService;
    @Autowired
    private Check_EmailService check_emailService;
    @Autowired
    private ImageService imageService;

    @GetMapping(value = "/thongtincanhan")
    public String personal_Information(Model model, Principal principal) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        model.addAttribute("getAccount", getAccount);
        return "user/personal_information";
    }

    @GetMapping(value = "/doimatkhau")
    public String page_change_password() {
        return "user/change-password";
    }

    @PostMapping(value = "/change_password")
    public String change_password(@RequestParam(name = "password1") String password1,
                                  @RequestParam(name = "password2") String password2,
                                  @RequestParam(name = "password3") String password3,
                                  Principal principal, Model model, RedirectAttributes redirect) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        // kiểm tra mật khẩu củ có khớp k
        if (encoder.matches(password1, getAccount.getPassword())) {
            if (password2.length() >= 8 && password2.length() <= 16) {
                if (password2.equals(password3)) {
                    getAccount.setPassword(encoder.encode(password2));
                    accountService.addAccount(getAccount);
                    redirect.addFlashAttribute("mes", "Đổi mật khẩu thành công.");
                    return "redirect:/user/thongtincanhan";
                } else {
                    model.addAttribute("mes", "Mật khẩu mới không khớp...!");
                    return "user/change-password";
                }
            } else {
                model.addAttribute("mes", "Mật khẩu quá dài hoặc quá ngắn...!");
                return "user/change-password";
            }
        } else {
            model.addAttribute("mes", "Mật khẩu củ không đúng...!");
            return "user/change-password";
        }
    }

    @GetMapping(value = "/history_product")
    public String history_product(Model model, Principal principal) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        List<OrderEntity> orderList = orderService.findByAccount_Id(getAccount.getId());
        model.addAttribute("orderList", orderList);
        return "user/history_product";
    }

    @GetMapping(value = "/chitietdonhang/{id}")
    public String history_detail_product(@PathVariable(value = "id") int id, Model model) {
        List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(id);
        model.addAttribute("orderDetailList", orderDetailList);
        OrderEntity order = orderService.findById(id);
        model.addAttribute("order", order);
        model.addAttribute("imageService", imageService);
        return "user/history_detail_product";
    }

    /**************************************************************************************************************/

    @GetMapping("/lichsumuahang/page/{pageNumber}")
    public String viewDemo(HttpServletRequest request,
                           @PathVariable int pageNumber, Model model, Principal principal) {
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("orderList");
        int pageSize = 10;
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        List<OrderEntity> orderList = orderService.findByAccount_Id(getAccount.getId());
        System.out.println(orderList.size());
        if (pages == null) {
            pages = new PagedListHolder<>(orderList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("orderList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - orderList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/user/lichsumuahang/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("orderList", pages);
        return "user/history_product";
    }

    @GetMapping(value = "/lichsumuahang")
    public String viewAccount(HttpServletRequest request) {
        request.getSession().setAttribute("orderList", null);
        return "redirect:/user/lichsumuahang/page/1";
    }

    @GetMapping(value = "/huydonhang/{id}")
    public String cancel_order(@PathVariable(value = "id") long id, Principal principal, Model model) {
        OrderEntity order = orderService.findById(id);
        List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(id);
        model.addAttribute("orderDetailList", orderDetailList);
        AccountEntity account = accountService.checkUsername(principal.getName());
        List<Check_EmailEntity> getMail = check_emailService.getAccountID(account.getId());
        if (getMail.isEmpty()) {
            String code = testInput.inputRamDom();
            Check_EmailEntity newCode = new Check_EmailEntity();
            newCode.setCode(code);
            newCode.setAccount(account);
            check_emailService.addCode(newCode);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("minhgavn2@gmail.com");
            message.setTo(order.getEmail());
            message.setSubject("Xác nhận huỷ của đơn hàng...!");
            message.setText("Mã xác nhận của bạn là: " + code);
            emailSender.send(message);
            model.addAttribute("order", order);
            return "user/check_code";
        } else {
            for (Check_EmailEntity check_emailEntity : getMail) {
                check_emailService.deleteCode(check_emailEntity.getId());
            }
            String code = testInput.inputRamDom();
            Check_EmailEntity newCode = new Check_EmailEntity();
            newCode.setCode(code);
            newCode.setAccount(account);
            check_emailService.addCode(newCode);
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("minhgavn2@gmail.com");
            message.setTo(order.getEmail());
            message.setSubject("Xác nhận huỷ của đơn hàng...!");
            message.setText("Mã xác nhận của bạn là: " + code);
            emailSender.send(message);
            model.addAttribute("order", order);
            return "user/check_code";
        }
    }

    @PostMapping(value = "/huydonhang")
    public String cancel_order_product(@RequestParam(name = "id") long id,
                                       @RequestParam(name = "code") String code,
                                       Principal principal, Model model) {
        AccountEntity account = accountService.checkUsername(principal.getName());
        // lấy ra tất cả các code của khách hàng đó
        Check_EmailEntity check_emailEntity = check_emailService.check_Code(code, account.getId());
        OrderEntity order = orderService.findById(id);
        if (check_emailEntity != null) {
            if (check_emailEntity.getCode().equals(code)) {
                order.setStatus("Đã hủy");
                orderService.addOrder(order);
                List<OrderDetailsEntity> orderDetailList = orderDetailsService.findByOrder_Id(order.getId());
                for (int i = 0; i < orderDetailList.size(); i++) {
                    ProductEntity product = productService.getProductID(orderDetailList.get(i).getProduct().getId());
                    if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                        product.setQuantity(product.getQuantity() + orderDetailList.get(i).getQuantity());
                        productService.addProduct(product);
                    }
                }
                List<Check_EmailEntity> check_emailEntities = check_emailService.getAccountID(account.getId());
                for (Check_EmailEntity checkEmail : check_emailEntities) {
                    check_emailService.deleteCode(checkEmail.getId());
                }
                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("minhgavn2@gmail.com");
                message.setTo(order.getEmail());
                message.setSubject("Xác nhận thông tin đơn hàng của bạn...!");
                message.setText("Đơn hàng"+ order.getId() +"của bạn đã bị hủy...! " + "\n" +
                        "Mọi thông tin xin liên hệ qua SDT: 0964554389");
                emailSender.send(message);
                return "redirect:/user/lichsumuahang";
            } else {
                model.addAttribute("order", order);
                model.addAttribute("mes", "Mã code không đúng...!");
                return "user/check_code";
            }
        } else {
            model.addAttribute("order", order);
            model.addAttribute("mes", "Mã code không đúng...!");
            return "user/check_code";
        }
    }

    @GetMapping(value = "/send-mail/{id}")
    public String send_mail(@PathVariable(value = "id") long id, Principal principal, Model model) {
        AccountEntity account = accountService.checkUsername(principal.getName());
        OrderEntity order = orderService.findById(id);

        List<Check_EmailEntity> check_emailEntities = check_emailService.getAccountID(account.getId());
        for (Check_EmailEntity checkEmail : check_emailEntities) {
            check_emailService.deleteCode(checkEmail.getId());
        }
        String code = testInput.inputRamDom();
        Check_EmailEntity newCode = new Check_EmailEntity();
        newCode.setCode(code);
        newCode.setAccount(account);
        check_emailService.addCode(newCode);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("minhgavn2@gmail.com");
        message.setTo(order.getEmail());
        message.setSubject("Xác nhận địa chỉ email của đơn hàng...!");
        message.setText("Mã xác nhận của bạn là: " + code);
        emailSender.send(message);
        model.addAttribute("order", order);
        return "user/check_code";
    }
}