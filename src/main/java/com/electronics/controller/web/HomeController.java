package com.electronics.controller.web;

import com.electronics.entity.BrandEntity;
import com.electronics.entity.CategoryEntity;
import com.electronics.service.IBrandService;
import com.electronics.service.ICategoryService;
import com.electronics.service.impl.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller(value = "homeControllerofWeb")
@RequestMapping(value = "/")
@Scope(value = "session")
public class HomeController {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private Cart cart;

    @RequestMapping(method = RequestMethod.GET)
    public String homePage(HttpSession session) {
        int quantityProduct = cart.countItem();
        List<CategoryEntity> categoryName = categoryService.getCategoryName();
        List<BrandEntity> brandName = brandService.getBrandName();
        session.setAttribute("categoryName", categoryName);
        session.setAttribute("brandName",brandName);
        session.setAttribute("quantityProduct", quantityProduct);
        return "redirect:/trangchu";
    }

}
