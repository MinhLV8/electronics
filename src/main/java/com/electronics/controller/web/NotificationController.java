package com.electronics.controller.web;

import com.electronics.entity.PromotionEntity;
import com.electronics.entity.PromotionProductsEntity;
import com.electronics.service.IPromotionProductsService;
import com.electronics.service.IPromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NotificationController {
    @Autowired
    private IPromotionService promotionService;

    @Autowired
    private IPromotionProductsService promotionProductsService;

    @GetMapping(value = "/promotion/page/{pageNumber}")
    public String notification(HttpServletRequest request,
                               @PathVariable int pageNumber,
                               Model model) {
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("promotionList");
        int pageSize = 5;
        List<PromotionEntity> promotionList = promotionService.getAllPromotion();

        if (pages == null) {
            pages = new PagedListHolder<>(promotionList);
            pages.setPageSize(pageSize);
        } else {
            final int goToPage = pageNumber - 1;
            if (goToPage <= pages.getPageCount() && goToPage >= 0) {
                pages.setPage(goToPage);
            }
        }
        request.getSession().setAttribute("promotionList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - promotionList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/promotion/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("promotionList", pages);
        return "notification";
    }

    @GetMapping(value = "/notification1")
    public String notification1(Model model) {
        PromotionEntity promotion = promotionService.getIdDesc();
        if (promotion != null) {
            List<PromotionProductsEntity> promotionProducts = promotionProductsService.getAllPromotionProduct(promotion.getId());
            model.addAttribute("promotion", promotion);
            model.addAttribute("promotionProducts", promotionProducts);
            return "notification";
        } else {
            model.addAttribute("promotion", promotion);
            return "notification";
        }
    }

    @GetMapping(value = "/promotion")
    public String viewAccount(HttpServletRequest request) {
        request.getSession().setAttribute("promotionList", null);
        return "redirect:/promotion/page/1";
    }

    /*
    @GetMapping(value = "/promotion-detail/{id}")
    public String promotion_detail(@PathVariable(value = "id") int id,Model model){
        List<PromotionProductsEntity> promotionProductList = promotionService.getAllPromotionProduct(id);
        PromotionEntity promotion = promotionService.getPromotion1();
        model.addAttribute("promotion", promotion);
        model.addAttribute("promotionProductList", promotionProductList);
        return "notification_detail";
    }

     */
}
