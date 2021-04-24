package com.electronics.controller.admin;

import com.electronics.entity.*;
import com.electronics.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "admin")
public class ManagerProductController {

    private final TestInput testInput = new TestInput();
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IProductService productService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IProductInforService productInformationService;
    @Autowired
    private IImageService imageService;

    private void setCategoryDropDowList(Model model) {
        List<CategoryEntity> categoryList = categoryService.findAll();
        if (!categoryList.isEmpty()) {
            Map<Long, String> categoryMap = new LinkedHashMap<>();
            for (CategoryEntity categoryEntity : categoryList) {
                categoryMap.put(categoryEntity.getId(), categoryEntity.getName());
            }
            model.addAttribute("categoryList", categoryMap);
        }
    }

    private void setBrandDropDowList(Model model) {
        List<BrandEntity> brandList = brandService.findAll();
        if (!brandList.isEmpty()) {
            Map<Long, String> brandMap = new LinkedHashMap<>();
            for (BrandEntity brandEntity : brandList) {
                brandMap.put(brandEntity.getId(), brandEntity.getName());
            }
            model.addAttribute("brandList", brandMap);
        }
    }

    @GetMapping("/sanpham")
    public String product_page(Model model) {
        List<ProductEntity> productList = productService.findAllByOrderByIdDesc();
        model.addAttribute("productList", productList);
        model.addAttribute("imageService", imageService);
        return "admin/product/list-product";
    }

    @GetMapping(value = "/sanpham/them")
    public String add_product(Model model) {
        model.addAttribute("product", new ProductEntity());
        setCategoryDropDowList(model);
        setBrandDropDowList(model);
        return "admin/product/add-product";
    }

    @PostMapping(value = "/save")
    @Transactional(rollbackOn = Exception.class)
    public String saveProduct(@RequestParam(name = "image") List<MultipartFile> image,
                              @RequestParam(name = "prices") String price,
                              ProductEntity product, RedirectAttributes redirect) throws IOException {
        product.setPrice(testInput.formatMoney(price));
        ProductInformationEntity productInformationEntity = product.getProductInformation();
        ProductEntity newProduct = productService.addProduct(product);
        productInformationEntity.setProduct(newProduct);
        for (MultipartFile file : image) {
            ImageEntity newImage = new ImageEntity();
            Path path = Paths.get("uploads/");
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            newImage.setUrl(file.getOriginalFilename().toLowerCase());
            newImage.setProduct(newProduct);
            imageService.addImage(newImage);
        }
        productInformationService.addProductInformation(productInformationEntity);
        redirect.addFlashAttribute("success", "Thêm sản phẩm thành công!");
        return "redirect:/admin/sanpham";
    }

    @GetMapping(value = "/sanpham/xoa/{id}")
    @Transactional(rollbackOn = Exception.class)
    public String delete_product(@PathVariable(value = "id") long id,
                                 RedirectAttributes redirect) {
        ProductEntity getProductID = productService.getProductID(id);
        List<ImageEntity> imageList = imageService.findByProduct_Id(getProductID.getId());
        imageService.deleteList(imageList);
        ProductInformationEntity productInformation = productInformationService.getProductInformation(getProductID.getId());
        productInformationService.delete(productInformation.getId());
        productService.delete(getProductID.getId());
        redirect.addFlashAttribute("success", "Xoá sản phẩm thành công!");
        return "redirect:/admin/sanpham";
    }

    @GetMapping(value = "/sanpham/capnhat/{id}")
    public String update_product(@PathVariable(value = "id") long id,
                                 Model model) {
        ProductEntity getProductID = productService.getProductID(id);
        model.addAttribute("getProductID", getProductID);
        model.addAttribute("imageService", imageService);
        setBrandDropDowList(model);
        setCategoryDropDowList(model);
        return "admin/product/update-product";
    }

    @GetMapping(value = "/sanpham/chitiet/{id}")
    public String detail_product(@PathVariable(value = "id") long id,
                                 Model model) {
        ProductEntity getProductID = productService.getProductID(id);
        ProductInformationEntity getInformation = productInformationService.getProductInformation_productID(getProductID.getId());
        model.addAttribute("getProductID", getProductID);
        model.addAttribute("productInfomation", getInformation);
        model.addAttribute("imageService", imageService);
        return "admin/product/detail-product";
    }

    @PostMapping(value = "/save-update-product")
    @Transactional(rollbackOn = Exception.class)
    public String save_product(@RequestParam(name = "image_file", required = false)
                               @RequestPart(required = false) MultipartFile[] file,
                               @RequestParam(name = "prices") String price,
                               ProductEntity product, RedirectAttributes redirect) throws IOException {
        product.setPrice(testInput.formatMoney(price));
        productService.addProduct(product);
        ProductInformationEntity productInformationEntity = productInformationService.getProductInformationID(product.getProductInformation().getId());
        productInformationEntity.setProduct(product);
        productInformationService.addProductInformation(product.getProductInformation());
        List<ImageEntity> imageList = imageService.findByProduct_Id(product.getId());
        if (file.length-1 > 0) {
            imageService.deleteList(imageList);
            for (MultipartFile multipartFile : file) {
                ImageEntity newImage = new ImageEntity();
                Path path = Paths.get("uploads/");
                InputStream inputStream = multipartFile.getInputStream();
                Files.copy(inputStream, path.resolve(multipartFile.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
                newImage.setUrl(multipartFile.getOriginalFilename().toLowerCase());
                newImage.setProduct(product);
                imageService.addImage(newImage);
            }
        }
        redirect.addFlashAttribute("success", "Cập nhật sản phẩm thành công!");
        return "redirect:/admin/sanpham";
    }

    @PostMapping("/sanpham-search/page/{pageNumber}")
    public String search_product(HttpServletRequest request,
                                 @PathVariable int pageNumber, Model model,
                                 @RequestParam(name = "search") String name) {
        List<ProductEntity> productList = productService.searchProductName(name);
        if (productList.isEmpty()) {
            PagedListHolder<?> pagedListHolder = (PagedListHolder<?>) request.getSession().getAttribute("productList");
            pagedListHolder = new PagedListHolder<>(productList);
            model.addAttribute("productList", pagedListHolder);
            return "admin/product/list-product";
        }
        PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
        int pagesize = 10;
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
        String baseUrl = "/admin/sanpham/page/";

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("baseUrl", baseUrl);
        model.addAttribute("productList", pages);
        return "admin/product/list-product";
    }
}
