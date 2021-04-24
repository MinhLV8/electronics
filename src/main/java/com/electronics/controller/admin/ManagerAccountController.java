package com.electronics.controller.admin;

import com.electronics.entity.AccountEntity;
import com.electronics.service.IAccountService;
import com.electronics.service.TestInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class ManagerAccountController {
    private final TestInput testInput = new TestInput();
    private final String[] enabled = {"True", "False"};
    @Autowired
    private IAccountService accountService;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @GetMapping(value = "/taikhoan")
    public String view_account(HttpServletRequest request, Model model, RedirectAttributes redirect) {
        request.getSession().setAttribute("accountList", null);
        if (model.asMap().get("success") != null)
            redirect.addFlashAttribute("success", model.asMap().get("success").toString());
        return "redirect:/admin/taikhoan/page/1";
    }

    @GetMapping("/taikhoan/page/{pageNumber}")
    public String account_page(HttpServletRequest request,
                               @PathVariable int pageNumber, Model model) {
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("accountList");
        int pageSize = 10;
        List<AccountEntity> accountList = accountService.findByOrderByIdDesc();
        if (pages == null) {
            pages = new PagedListHolder<>(accountList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("accountList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - accountList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/manager-account/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("accountList", pages);
        return "admin/accounts/list-acc";
    }

    @PostMapping("/search-taikhoan/page/{pageNumber}")
    public String search_account(HttpServletRequest request,
                                 @PathVariable int pageNumber, Model model,
                                 @RequestParam(name = "search") String name) {
        List<AccountEntity> accountList = accountService.searchAccountName(name);
        if (accountList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("accountList");
            pagedListHolder = new PagedListHolder<>(accountList);
            model.addAttribute("accountList", pagedListHolder);
            return "admin/accounts/list-acc";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("categoryList");
        int pagesize = 10;
        pages = new PagedListHolder<>(accountList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("accountList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - accountList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/taikhoan/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("accountList", pages);
        return "admin/accounts/list-acc";
    }

    @GetMapping(value = "/taikhoan/capnhat/{id}")
    public String edit_account(@PathVariable(value = "id") long id, Model model) {
        AccountEntity account = accountService.findById(id);
        model.addAttribute("account", account);
        model.addAttribute("enabled", enabled);
        return "admin/accounts/update-account";
    }

    @PostMapping(value = "/update-account")
    public String update_account(AccountEntity account,
                                 @RequestParam(name = "password") String password, Model model,
                                 RedirectAttributes redirect) {
        AccountEntity getAccount = accountService.findById(account.getId());
        if (getAccount.getPassword().equals(password)) {
            getAccount.setEnabled(account.isEnabled());
            accountService.addAccount(getAccount);
            redirect.addFlashAttribute("success", "Saved account successfully!");
            return "redirect:/admin/taikhoan";
        } else {
            if (password.length() >= 8 && password.length() <= 16) {
                if (testInput.space(password) == 0) {
                    getAccount.setPassword(encoder.encode(password));
                    getAccount.setEnabled(account.isEnabled());
                    accountService.addAccount(getAccount);
                    redirect.addFlashAttribute("success", "Saved account successfully!");
                    return "redirect:/admin/taikhoan";
                } else {
                    model.addAttribute("mes", "Mật khẩu không sử dụng khoảng trắng...!");
                    model.addAttribute("account", account);
                    model.addAttribute("enabled", enabled);
                    return "update-account";
                }
            } else {
                model.addAttribute("mes", "Mật khẩu quá ngắn hoặc quá dài...!");
                model.addAttribute("account", account);
                model.addAttribute("enabled", enabled);
                return "update-account";
            }
        }
    }
}
