package com.electronics.controller.admin;

import com.electronics.entity.AccountEntity;
import com.electronics.entity.RoleEntity;
import com.electronics.entity.StaffEntity;
import com.electronics.service.impl.AccountService;
import com.electronics.service.impl.RoleService;
import com.electronics.service.impl.StaffService;
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
import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping(value = "admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class ManagerStaffController {
    @Autowired
    private StaffService staffService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private AccountService accountService;

    private String[] position = {"Quản lý","Nhân viên","Trưởng phòng"};

    private TestInput testInput = new TestInput();

    @Autowired
    private BCryptPasswordEncoder encoder;


    @GetMapping(value = "/nhanvien")
    public String view_staff(HttpServletRequest request, Model model, RedirectAttributes redirect){
        request.getSession().setAttribute("staffList", null);
        if(model.asMap().get("success") != null)
            redirect.addFlashAttribute("success",model.asMap().get("success").toString());
        return "redirect:/admin/nhanvien/page/1";
    }

    @GetMapping("/nhanvien/page/{pageNumber}")
    public String staff_page(HttpServletRequest request,
                                @PathVariable int pageNumber, Model model){
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("staffList");
        int pageSize = 10;
        List<StaffEntity> staffList = staffService.findByOrderByIdDesc();
        if (pages == null) {
            pages = new PagedListHolder<>(staffList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("staffList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - staffList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/nhanvien/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("staffList", pages);
        return "admin/accounts/list-staff";
    }

    @PostMapping("/search-staff/page/{pageNumber}")
    public String search_staff(HttpServletRequest request,
                                  @PathVariable int pageNumber, Model model,
                                  @RequestParam(name = "search")String name){
        List<StaffEntity> staffList = staffService.findByNameOrUsernameLike(name);
        if(staffList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("staffList");
            pagedListHolder = new PagedListHolder<>(staffList);
            model.addAttribute("staffList", pagedListHolder);
            return "admin/accounts/list-staff";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("staffList");
        int pagesize = 10;
        pages = new PagedListHolder<>(staffList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("staffList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - staffList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/nhanvien/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("staffList", pages);
        return "admin/accounts/list-staff";
    }

    @GetMapping(value = "/nhanvien/them")
    public String addStaff(Model model){
        model.addAttribute("staff", new StaffEntity());
        model.addAttribute("position", position);
        return "admin/accounts/add-staff";
    }

    @PostMapping(value = "/save-staff")
    public String save_staff(StaffEntity staff,@RequestParam(name = "username")String username,
                             @RequestParam(name = "password") String password,
                            @RequestParam(name = "password1")String password1, Model model,
                             RedirectAttributes redirect) {
        if (testInput.space(username) != 0) {
            model.addAttribute("mes", "Tài khoản không sử dụng khoảng trắng...!");
            model.addAttribute("staff", new StaffEntity());
            model.addAttribute("position", position);
            return "admin/accounts/add_staff";
        } else if (username.length() < 8 || username.length() > 30) {
            model.addAttribute("mes", "Tài khoản quá ngắn hoặc quá dài...!");
            model.addAttribute("staff", new StaffEntity());
            model.addAttribute("position", position);
            return "admin/accounts/add_staff";
        } else if (accountService.checkUsername(username) != null) {
            model.addAttribute("mes", "Tài khoản này đã tồn tại...!");
            model.addAttribute("staff", new StaffEntity());
            model.addAttribute("position", position);
            return "admin/accounts/add_staff";
        } else if (testInput.space(password) != 0) {
            model.addAttribute("mes", "Mật khẩu không sử dụng khoảng trắng...!");
            model.addAttribute("staff", new StaffEntity());
            model.addAttribute("position", position);
            return "admin/add_staff";
        } else if (password.length() < 8 || password.length() > 16) {
            model.addAttribute("mes", "Mật khẩu quá ngắn hoặc quá dài...!");
            model.addAttribute("staff", new StaffEntity());
            model.addAttribute("position", position);
            return "admin/accounts/add_staff";
        } else {
            if (password.equals(password1)) {
                // add account
                AccountEntity newAccount = new AccountEntity();
                newAccount.setUsername(username);
                newAccount.setPassword(encoder.encode(password));
                newAccount.setEnabled(true);
                RoleEntity roleEntity = roleService.getRoleName("ROLE_STAFF");
                newAccount.setRole(new HashSet<>(Arrays.asList(roleEntity)));
                accountService.addAccount(newAccount);

                // add staff
                staff.setAccount(newAccount);
                staffService.addStaff(staff);
                redirect.addFlashAttribute("success","Add staff successfully!");
                return "redirect:/admin/nhanvien";
            } else {
                model.addAttribute("mes", "Mật khẩu không khớp...!");
                model.addAttribute("staff", new StaffEntity());
                model.addAttribute("position", position);
                return "admin/accounts/add_staff";
            }
        }
    }

    @GetMapping(value = "/nhanvien/capnhat/{id}")
    public String edit_staff(@PathVariable(value = "id") long id, Model model){
        StaffEntity staff = staffService.findById(id);
        model.addAttribute("staff", staff);
        model.addAttribute("position", position);
        return "admin/accounts/update-staff";
    }

    @PostMapping(value = "/update-staff")
    public String update_staff(StaffEntity staff, RedirectAttributes redirect){
        AccountEntity account = new AccountEntity();
        account.setName(staff.getAccount().getName());
        staff.setPhone(staff.getPhone());
        staff.setAddress(staff.getAddress());
        staff.setPosition(staff.getPosition());
        accountService.addAccount(account);
        staffService.addStaff(staff);
        redirect.addFlashAttribute("success","Saved staff successfully!");
        return "redirect:/admin/nhanvien";
    }
}
