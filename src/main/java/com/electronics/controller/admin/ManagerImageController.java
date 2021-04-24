package com.electronics.controller.admin;

import com.electronics.entity.ImageEntity;
import com.electronics.entity.ProductEntity;
import com.electronics.service.IProductService;
import com.electronics.service.impl.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
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
public class ManagerImageController {
    @Autowired
    private ImageService imageService;

    @Autowired
    private IProductService productService;

    private void setProductList(Model model){
        List<ProductEntity> productList = productService.findAllByOrderByIdDesc();
        Map<Long, String> map = new LinkedHashMap<>();
        for (ProductEntity product : productList){
            map.put(product.getId(),product.getName());
        }
        model.addAttribute("productList", map);
    }

    @GetMapping("/hinhanh")
    public String image_page(Model model){
        List<ImageEntity> imageList = imageService.finByImage();
        model.addAttribute("imageList", imageList);
        return "admin/image/manager_image";
    }

    @GetMapping(value = "/add-image")
    public String add_image(Model model){
        model.addAttribute("image", new ImageEntity());
        setProductList(model);
        return "admin/image/add_image";
    }

    @PostMapping(value = "/save-image")
    public String save_image(ImageEntity newImage,
                             @RequestParam(name = "inpFile") MultipartFile[] image,
                             RedirectAttributes redirect) throws IOException {
        for (MultipartFile file : image){
            Path path = Paths.get("uploads/");
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            newImage.setUrl(file.getOriginalFilename().toLowerCase());
            imageService.addImage(newImage);
        }
        redirect.addFlashAttribute("success","Add image successfully!");
        return "redirect:/admin/hinhanh";
    }

    @GetMapping(value = "/edit-image/{id}")
    public String edit_image(@PathVariable(value = "id") int id, Model model){
        ImageEntity image = imageService.finById(id);
        setProductList(model);
        model.addAttribute("image", image);
        return "admin/image/update_image";
    }

    @PostMapping(value = "/update-image")
    public String update(ImageEntity newImage,
                             @RequestParam(name = "inpFile") MultipartFile[] image,
                             RedirectAttributes redirect) throws IOException {
        for (MultipartFile file : image){
            Path path = Paths.get("uploads/");
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
            newImage.setUrl(file.getOriginalFilename().toLowerCase());
            imageService.addImage(newImage);
        }
        redirect.addFlashAttribute("success","Saved image successfully!");
        return "redirect:/admin/hinhanh";
    }

    @GetMapping(value = "/delete-image/{id}")
    public String delete_image(@PathVariable(value = "id")long id, RedirectAttributes redirect){
        imageService.deleteImage(id);
        redirect.addFlashAttribute("success","Deleted image successfully!");
        return "redirect:/admin/hinhanh";
    }
}
