package com.electronics.controller.web;

import com.electronics.entity.*;
import com.electronics.service.*;
import com.electronics.service.impl.ImageService;
import com.electronics.service.impl.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private IProductService productService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private ICommentService commentService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IProductInforService productInformationService;

    @Autowired
    private PromotionService promotionService;


    @GetMapping(value = "/chitietsanpham/{id}")
    public String productDetail(@PathVariable(value = "id") Long id, Model model, RedirectAttributes redirect) {
        ProductEntity productID = productService.getProductID(id);
        PromotionEntity promotion = promotionService.getPromotion(productID.getId());
        List<ImageEntity> imageList = imageService.getImageProduct(productID.getId());
        List<CommentsEntity> commentsList = commentService.getCommentProduct(productID.getId());
        List<ProductEntity> productSelling = productService.sellingProducts1();
        List<CategoryEntity> categoryName = categoryService.getCategoryName();
        model.addAttribute("promotion", promotion);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("commentsList", commentsList);
        model.addAttribute("imageList", imageList);
        model.addAttribute("productID", productID);

        if (model.asMap().get("success") != null)
            redirect.addFlashAttribute("success", model.asMap().get("success").toString());
        return "web/product_detail";
    }

    @GetMapping(value = "/recentProducts")
    public String recentProducts(Model model) {
        List<ProductEntity> recentProducts = productService.recentProducts();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("productList", recentProducts);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping(value = "/sellingProducts")
    public String sellingProducts(Model model) {
        List<ProductEntity> sellingProducts = productService.sellingProducts();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("imageService", imageService);
        model.addAttribute("productList", sellingProducts);
        return "web/product";
    }

    @PostMapping(value = "/searchProductName")
    public String searchProductName(@RequestParam(name = "search") String name, Model model) {
        List<ProductEntity> productList = productService.searchProductName(name);
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @GetMapping(value = "/searchCategoryName/{name}")
    public String searchCategoryName(@PathVariable(value = "name") String name, Model model) {
        List<ProductEntity> productList = productService.searchCategoryName(name);
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @PostMapping(value = "/comment/{id}")
    public String comment(@PathVariable(value = "id") long id,
                          @RequestParam(name = "comment") String comment,
                          Principal principal) {
        AccountEntity getAccount = accountService.checkUsername(principal.getName());
        ProductEntity getProduct = productService.getProductID(id);
        if (getAccount != null) {
            CommentsEntity newComment = new CommentsEntity();
            newComment.setAccount(getAccount);
            newComment.setProduct(getProduct);
            newComment.setComment(comment);
            commentService.addComment(newComment);
            return "redirect:/sanpham/{id}";
        } else {
            return "redirect:/dangnhap";
        }
    }

    @GetMapping(value = "/search-price-below-5t")
    public String searchTo5(Model model) {
        List<ProductEntity> productList = productService.searchTo5();
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @GetMapping(value = "/search-price-5to10t")
    public String search5to10(Model model) {
        List<ProductEntity> productList = productService.search5To10();
        model.addAttribute("productList", productList);
        return "product";
    }

    @GetMapping(value = "/search-price-10to15t")
    public String search10to15(Model model) {
        List<ProductEntity> productList = productService.search10To15();
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @GetMapping(value = "/search-price-15to20t")
    public String search15to20(Model model) {
        List<ProductEntity> productList = productService.search15To20();
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @GetMapping(value = "/search-price-20to25t")
    public String search20to25(Model model) {
        List<ProductEntity> productList = productService.search20To25();
        model.addAttribute("productList", productList);
        return "web/product";
    }

    @GetMapping(value = "/search-price-on-25t")
    public String searchTo25(Model model) {
        List<ProductEntity> productList = productService.searchTo25();
        model.addAttribute("productList", productList);
        return "web/product";
    }
}
