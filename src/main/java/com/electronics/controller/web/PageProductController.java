package com.electronics.controller.web;

import com.electronics.entity.BrandEntity;
import com.electronics.entity.CategoryEntity;
import com.electronics.entity.ProductEntity;
import com.electronics.entity.PromotionEntity;
import com.electronics.service.IBrandService;
import com.electronics.service.ICategoryService;
import com.electronics.service.IProductService;
import com.electronics.service.impl.ImageService;
import com.electronics.service.impl.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PageProductController {
    @Autowired
    private IProductService productService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IBrandService iBrandService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private PromotionService promotionService;

    @GetMapping(value = "/search-product-name")
    public String view_product(HttpServletRequest request) {
        request.getSession().setAttribute("productList", null);
        return "redirect:/sanpham/page/1";
    }

    // search name
    @PostMapping("/timkiem/page/{pageNumber}")
    public String product_name(HttpServletRequest request,
                               @PathVariable int pageNumber,
                               Model model,
                               @RequestParam(name = "search") String name) {
        List<ProductEntity> productList = productService.searchProductName(name);
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        List<BrandEntity> brandList = iBrandService.getBrandName();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/product/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("brandList", brandList);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    // search category
    @GetMapping("/{name}/page/{pageNumber}")
    public String product_category(HttpServletRequest request,
                                   @PathVariable int pageNumber,
                                   Model model,
                                   @PathVariable(value = "name") String name) {
        List<ProductEntity> productList = productService.searchCategoryName(name);
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<BrandEntity> brandList = iBrandService.getBrandName();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("brandList", brandList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 12;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("brandList", brandList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    /* danh sách sản phẩm theo thương hiệu */
    @GetMapping("/thuonghieu/{namebrand}/page/{pageNumber}")
    public String product_brand(HttpServletRequest request,
                                @PathVariable int pageNumber,
                                Model model,
                                @PathVariable(value = "namebrand") String namebrand) {
        List<ProductEntity> productList = productService.searchBrandName(namebrand);
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<BrandEntity> brandList = iBrandService.getBrandName();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("brandList", brandList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 12;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/thuonghieu/{namebrand}/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("brandList", brandList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    // search search-price-below-5t
    @GetMapping("/product-price-below-5t/page/{pageNumber}")
    public String product_price_below_5t(HttpServletRequest request,
                                         @PathVariable int pageNumber,
                                         Model model, HttpSession session) {
        List<ProductEntity> productList = productService.searchTo25();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-price-5-10t/page/{pageNumber}")
    public String product_price_5_10t(HttpServletRequest request,
                                      @PathVariable int pageNumber,
                                      Model model, HttpSession session) {
        List<ProductEntity> productList = productService.search5To10();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-price-10-15t/page/{pageNumber}")
    public String product_price_10_15t(HttpServletRequest request,
                                       @PathVariable int pageNumber,
                                       Model model, HttpSession session) {
        List<ProductEntity> productList = productService.search10To15();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-price-15-20t/page/{pageNumber}")
    public String product_price_15_20t(HttpServletRequest request,
                                       @PathVariable int pageNumber,
                                       Model model, HttpSession session) {
        List<ProductEntity> productList = productService.search15To20();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-price-20-25t/page/{pageNumber}")
    public String product_price_20_25t(HttpServletRequest request,
                                       @PathVariable int pageNumber,
                                       Model model, HttpSession session) {
        List<ProductEntity> productList = productService.search20To25();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-price-on-25t/page/{pageNumber}")
    public String product_price_on_25t(HttpServletRequest request,
                                       @PathVariable int pageNumber,
                                       Model model, HttpSession session) {
        List<ProductEntity> productList = productService.searchTo25();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-selling/page/{pageNumber}")
    public String productSelling(HttpServletRequest request,
                                 @PathVariable int pageNumber,
                                 Model model, HttpSession session) {
        List<ProductEntity> productList = productService.sellingProducts();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }

    @GetMapping("/product-recent/page/{pageNumber}")
    public String recentProducts(HttpServletRequest request,
                                 @PathVariable int pageNumber,
                                 Model model) {
        List<ProductEntity> productList = productService.recentProducts();
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> productSelling = productService.sellingProducts1();
        PromotionEntity promotion = promotionService.getPromotion1();
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            model.addAttribute("productSelling", productSelling);
            model.addAttribute("categoryList", categoryList);
            return "web/product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 5;
        pages = new PagedListHolder<>(productList);
        pages.setPageSize(pagesize);

        final int goToPage = pageNumber - 1;
        if (goToPage <= pages.getPageCount() && goToPage >= 0) {
            pages.setPage(goToPage);
        }
        request.getSession().setAttribute("productList", pages);
        int current = pages.getPage() + 1;
        int begin = Math.max(1, current - productList.size());
        int end = Math.min(begin + 5, pages.getPageCount());
        int totalPageCount = pages.getPageCount();
        String baseUrl = "/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        model.addAttribute("productSelling", productSelling);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotion", promotion);
        model.addAttribute("imageService", imageService);
        return "web/product";
    }
}
