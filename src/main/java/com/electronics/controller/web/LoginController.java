package com.electronics.controller.web;

import com.electronics.entity.*;
import com.electronics.service.*;
import com.electronics.service.impl.Cart;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Controller
@Scope(value = "session")
public class LoginController {

    @Autowired
    private IProductService productService;

    @Autowired
    private IPromotionService promotionService;

    private final TestInput testInput = new TestInput();

    @Autowired
    private IAccountService accountService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private IRoleService roleService;

    @GetMapping(value = "/trangchu")
    public String homePage(Model model) {
        List<ProductEntity> recentProducts = productService.recentProducts();
        List<ProductEntity> sellingProducts = productService.sellingProducts();
        List<ProductEntity> promotionList = productService.productPromotion();
        List<ProductEntity> productList = productService.findAll();
        model.addAttribute("productList",productList);
        model.addAttribute("promotionList", promotionList);
        model.addAttribute("recentProducts", recentProducts);
        model.addAttribute("sellingProducts", sellingProducts);
        model.addAttribute("promotionService", promotionService);
        return "web/index";
    }

    @GetMapping(value = "/dangnhap")
    public String login() {
        return "web/login";
    }


    @GetMapping(value = "/dangky")
    public String registration() {
        return "web/register";
    }

    @GetMapping(value = "/dangnhapFail")
    public String loginError(Model model) {
        model.addAttribute("mes", "Tài khoản hoặc mật khẩu không đúng");
        return "web/login";
    }

    @RequestMapping(value = "/dangkyTaikhoan", method = RequestMethod.POST)
    public String registrationAccount(@RequestParam(name = "name") String name,
                                      @RequestParam(name = "username") String username,
                                      @RequestParam(name = "password") String password,
                                      @RequestParam(name = "password1") String password1,
                                      Model model) {
        if (testInput.space(username) != 0) {
            model.addAttribute("mes", "Tài khoản không sử dụng khoảng trắng...!");
            return "web/register";
        } else if (username.length() < 8 || username.length() > 30) {
            model.addAttribute("mes", "Tài khoản quá ngắn hoặc quá dài...!");
            return "web/register";
        } else if (accountService.checkUsername(username) != null) {
            model.addAttribute("mes", "Tài khoản này đã tồn tại...!");
            return "web/register";
        } else if (testInput.space(password) != 0) {
            model.addAttribute("mes", "Mật khẩu không sử dụng khoảng trắng...!");
            return "web/register";
        } else if (password.length() < 8 || password.length() > 16) {
            model.addAttribute("mes", "Mật khẩu quá ngắn hoặc quá dài...!");
            return "web/register";
        } else {
            if (password.equals(password1)) {
                AccountEntity newAccount = new AccountEntity();
                newAccount.setName(name);
                newAccount.setUsername(username);
                newAccount.setPassword(encoder.encode(password));
                newAccount.setEnabled(true);
                RoleEntity roleEntity = roleService.getRoleName("ROLE_USER");
                newAccount.setRole(new HashSet<>(Arrays.asList(roleEntity)));
                accountService.addAccount(newAccount);
                model.addAttribute("username", username);
                model.addAttribute("password", password);
                model.addAttribute("success","Đăng ký thành công");
                return "web/login";
            } else {
                model.addAttribute("mes", "Mật khẩu không khớp...!");
                return "web/register";
            }
        }
    }

    @GetMapping(value = "/403")
    public String ero() {
        return "web/403";
    }

    @GetMapping(value = "/index")
    public String home(Principal principal, HttpSession session) {
        AccountEntity account = accountService.checkUsername(principal.getName());
        if (account.isEnabled()==true) {
            session.setAttribute("username", principal.getName());
            return "redirect:/";
        } else {
            session.setAttribute("username", principal.getName());
            return "redirect:/login-block";
        }
    }

    @RequestMapping(value = "/username", method = RequestMethod.GET)
    @ResponseBody
    public String currentUserName(Authentication authentication) {
        return authentication.getName();
    }

    @GetMapping(value = "/login-block")
    public String login_block(Model model) {
        model.addAttribute("mes", "Tài khoản đã bị khoá");
        return "web/login";
    }
}