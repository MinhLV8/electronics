package com.electronics.controller.admin;

import com.electronics.entity.CategoryEntity;
import com.electronics.service.ICategoryService;
import com.electronics.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "admin")
public class ManagerCategoryController {
    @Autowired
    private ICategoryService categoryService;

    @GetMapping(value = "/theloai")
    public String view_category(HttpServletRequest request, Model model, RedirectAttributes redirect) {
        request.getSession().setAttribute("categoryList", null);
        if (model.asMap().get("success") != null)
            redirect.addFlashAttribute("success", model.asMap().get("success").toString());
        return "redirect:/admin/theloai/page/1";
    }

    @GetMapping("/theloai/page/{pageNumber}")
    public String category_page(HttpServletRequest request,
                                @PathVariable int pageNumber, Model model) {
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("categoryList");
        int pageSize = 5;
        List<CategoryEntity> categoryList = categoryService.findAllOrderByIdDesc();
        if (pages == null) {
            pages = new PagedListHolder<>(categoryList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("categoryList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - categoryList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/theloai/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("categoryList", pages);
        return "admin/category/list";
    }

    @PostMapping("/search-category/page/{pageNumber}")
    public String search_category(HttpServletRequest request,
                                  @PathVariable int pageNumber, Model model,
                                  @RequestParam(name = "search") String name) {
        List<CategoryEntity> categoryList = categoryService.finByNameLike(name);
        if (categoryList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("categoryList");
            pagedListHolder = new PagedListHolder<>(categoryList);
            model.addAttribute("categoryList", pagedListHolder);
            return "admin/category/list";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("categoryList");
        int pagesize = 5;
        pages = new PagedListHolder<>(categoryList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("categoryList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - categoryList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/theloai/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("categoryList", pages);
        return "admin/category/list";
    }

    @GetMapping(value = "/theloai/them")
    public String add_Category(Model model) {
        model.addAttribute("category", new CategoryEntity());
        return "admin/category/add";
    }

    @PostMapping(value = "/save-category")
    public String save_category(CategoryEntity category, RedirectAttributes redirect) {
        categoryService.addCategory(category);
        redirect.addFlashAttribute("success", "Add category successfully!");
        return "redirect:/admin/theloai";
    }

    @PostMapping(value = "/save-update-category")
    public String save_category_update(CategoryEntity category, RedirectAttributes redirect) {
        categoryService.addCategory(category);
        redirect.addFlashAttribute("success", "Saved category successfully!");
        return "redirect:/admin/theloai";
    }

    @GetMapping(value = "/theloai/xoa/{id}")
    @PreAuthorize("hasRole('ROLE_ADMIN')")// sử dụng method get
    public String delete_category(@PathVariable(value = "id") int id, RedirectAttributes redirect) {
        categoryService.deleteCategory(id);
        redirect.addFlashAttribute("success", "Deleted category successfully!");
        return "redirect:/admin/theloai";
    }

    @GetMapping(value = "/theloai/capnhat/{id}")
    public String update_category(@PathVariable(value = "id") int id, Model model) {
        CategoryEntity category = categoryService.findByCategoryID(id);
        model.addAttribute("category", category);
        return "admin/category/update";
    }
}
//    @PostAuthorize()// sử dụng method post