package com.electronics.controller.admin;

import com.electronics.entity.ProductEntity;
import com.electronics.entity.ProductInformationEntity;
import com.electronics.service.IProductInforService;
import com.electronics.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "admin")
public class ManagerProductInformationController {
    @Autowired
    private IProductInforService productInformationService;

    @Autowired
    private IProductService productService;

    private String[] operatingSystem = {"Windowns 10", "Mac OS", "Linux", "Ubuntu"};

    private void setProductDropDowList(Model model) {
        List<ProductEntity> productList = productService.findAllByOrderByIdDesc();
        if (!productList.isEmpty()) {
            Map<Long, String> productMap = new LinkedHashMap<>();
            for (ProductEntity productEntity : productList) {
                productMap.put(productEntity.getId(), productEntity.getName());
            }
            model.addAttribute("productList", productMap);
        }
    }

    @GetMapping(value = "/manage-productInformation")
    public String ProductInformation(HttpServletRequest request, Model model, RedirectAttributes redirect) {
        request.getSession().setAttribute("productInformationList", null);
        if (model.asMap().get("success") != null)
            redirect.addFlashAttribute("success", model.asMap().get("success").toString());
        return "redirect:/admin/manager-productInformation/page/1";
    }

    @GetMapping("/manager-productInformation/page/{pageNumber}")
    public String productInformation_page(HttpServletRequest request,
                                          @PathVariable int pageNumber, Model model) {
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productInformationList");
        int pageSize = 5;
        List<ProductInformationEntity> productInformationList = productInformationService.findAllByOrderByIdDesc();
        if (pages == null) {
            pages = new PagedListHolder<>(productInformationList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("productInformationList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productInformationList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/manager-productInformation/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productInformationList", pages);
        return "admin/manager_productInformation";
    }

    @GetMapping(value = "/edit-productInformation/{id}")
    public String edit_productInformation(@PathVariable(value = "id") long id, Model model) {
        ProductInformationEntity productInformationID = productInformationService.getProductInformationID(id);
        model.addAttribute("productInformationID", productInformationID);
        setProductDropDowList(model);
        model.addAttribute("operatingSystem", operatingSystem);
        return "admin/update_productInformation";
    }

    @PostMapping(value = "/update-productInformation")
    public String update_productInformation(ProductInformationEntity productInformation,
                                            RedirectAttributes redirect) {
        productInformationService.addProductInformation(productInformation);
        redirect.addFlashAttribute("success", "Saved productInformation successfully!");
        return "redirect:/admin/manage-productInformation";
    }

    @PostMapping("/search-productInformation-name/page/{pageNumber}")
    public String productInformation(HttpServletRequest request,
                                     @PathVariable int pageNumber, Model model,
                                     @RequestParam(name = "search") String name) {
        List<ProductInformationEntity> productInformationList = productInformationService.searchProductInformation(name);
        if (productInformationList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productInformationList");
            pagedListHolder = new PagedListHolder<>(productInformationList);
            model.addAttribute("productInformationList", pagedListHolder);
            return "admin/manager_productInformation";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productInformationList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productInformationList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productInformationList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productInformationList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/admin/manager-productInformation/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productInformationList", pages);
        return "admin/manager_productInformation";
    }
}
