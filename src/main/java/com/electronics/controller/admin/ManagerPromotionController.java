package com.electronics.controller.admin;

import com.electronics.entity.ProductEntity;
import com.electronics.entity.PromotionEntity;
import com.electronics.entity.PromotionProductsEntity;
import com.electronics.service.IImageService;
import com.electronics.service.IProductService;
import com.electronics.service.IPromotionProductsService;
import com.electronics.service.IPromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "admin")
public class ManagerPromotionController {

    private final String[] decrease = {"Giảm theo %", "Giảm theo giá"};
    @Autowired
    private IPromotionService promotionService;
    @Autowired
    private IPromotionProductsService promotionProductsService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IImageService imageService;

    private void setProduct(Model model) {
        List<ProductEntity> productList = productService.findAllByOrderByIdDesc();
        if (!productList.isEmpty()) {
            Map<Long, String> map = new LinkedHashMap<>();
            for (ProductEntity product : productList) {
                map.put(product.getId(), product.getName());
            }
            model.addAttribute("productList", map);
        }
    }

    private void setPromotion(Model model) {
        List<PromotionEntity> promotionList = promotionService.getAllPromotion();
        if (!promotionList.isEmpty()) {
            Map<Long, String> map = new LinkedHashMap<>();
            for (PromotionEntity promotion : promotionList) {
                map.put(promotion.getId(), promotion.getTitle());
            }
            model.addAttribute("promotionList", map);
        }
    }

    @GetMapping("/khuyenmai")
    public String promotion_page(Model model) {
        List<PromotionEntity> promotionList = promotionService.getAllPromotion();
        model.addAttribute("promotionList", promotionList);
        return "admin/promotion/manager_promotion";
    }

    @GetMapping(value = "/khuyenmai/capnhat/{id}")
    public String edit_promotion(@PathVariable(value = "id") long id, Model model) {
        PromotionEntity promotion = promotionService.finById(id);
        List<PromotionProductsEntity> promotionProductList = promotionProductsService.getAllPromotionProduct(promotion.getId());
        model.addAttribute("promotionProductList", promotionProductList);
        model.addAttribute("PromotionProduct", new PromotionProductsEntity());
        model.addAttribute("promotionID",id);
        model.addAttribute("promotion", promotion);
        model.addAttribute("decrease", decrease);
        setProduct(model);
        setPromotion(model);
        return "admin/promotion/update_promotion";
    }

    @GetMapping(value = "/khuyenmai/chitiet/{id}")
    public String edit_promotion_product(@PathVariable(value = "id") long id, Model model) {
        PromotionEntity promotion = promotionService.finById(id);
        List<PromotionProductsEntity> promotionProductList = promotionProductsService.getAllPromotionProduct(promotion.getId());
        model.addAttribute("promotionProductList", promotionProductList);
        return "admin/promotion/promotion-product";
    }

    @GetMapping(value = "/khuyenmai/them")
    public String add_promotion(Model model) {
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("decrease", decrease);
        return "admin/promotion/add_promotion";
    }

    @PostMapping(value = "/save-promotion")
    public String save_promotion(PromotionEntity promotion,
                                 @RequestParam(name = "money") int money, Model model,
                                 RedirectAttributes redirect) {
        if (promotion.getDecrease().equals("Giảm theo %")) {
            // kiểm tra giá theo % có hợp lệ k
            if (money >= 0 && money <= 100) {
                // kiểm tra ngày bắt đầu phải lớn hơn ngày hiện tại
                if (promotion.getStartDate().compareTo(LocalDate.now()) >= 0) {
                    // kiểm tra ngày kết thúc phải lớn hơn ngày bắt đầu
                    if (promotion.getEndDate().compareTo(promotion.getStartDate()) >= 0) {
                        promotion.setMoneyDeals(money);
                        promotionService.addPromotion(promotion);
                        redirect.addFlashAttribute("success", "Thêm khuyến mãi thành công!");
                        return "redirect:/admin/khuyenmai";
                    } else {
                        model.addAttribute("mes", "Ngày kết thúc phải lớn hơn ngày bắt đầu...!");
                        model.addAttribute("promotion", new PromotionEntity());
                        model.addAttribute("decrease", decrease);
                        return "admin/promotion/add_promotion";
                    }
                } else {
                    model.addAttribute("mes", "Ngày bắt đầu phải lớn hơn ngày hiện tại...!");
                    model.addAttribute("promotion", new PromotionEntity());
                    model.addAttribute("decrease", decrease);
                    return "admin/promotion/add_promotion";
                }
            } else {
                model.addAttribute("mes", "Mức giảm không hợp lệ...!");
                model.addAttribute("promotion", new PromotionEntity());
                model.addAttribute("decrease", decrease);
                return "admin/promotion/add_promotion";
            }
        } else {
            if (money >= 1000) {
                if (promotion.getStartDate().compareTo(LocalDate.now()) >=0) {
                    if (promotion.getEndDate().compareTo(promotion.getStartDate()) >=0) {
                        promotion.setMoneyDeals(money);
                        promotionService.addPromotion(promotion);
                        redirect.addFlashAttribute("success", "Thêm khuyến mãi thành công!");
                        return "redirect:/admin/khuyenmai";
                    } else {
                        model.addAttribute("mes", "Ngày kết thúc phải lớn hơn ngày bắt đầu...!");
                        model.addAttribute("promotion", new PromotionEntity());
                        model.addAttribute("decrease", decrease);
                        return "admin/promotion/add_promotion";
                    }
                } else {
                    model.addAttribute("mes", "Ngày bắt đầu phải lớn hơn ngày hiện tại...!");
                    model.addAttribute("promotion", new PromotionEntity());
                    model.addAttribute("decrease", decrease);
                    return "admin/promotion/add_promotion";
                }
            } else {
                model.addAttribute("mes", "Mức giảm không hợp lệ...!");
                model.addAttribute("promotion", new PromotionEntity());
                model.addAttribute("decrease", decrease);
                return "admin/promotion/add_promotion";
            }
        }
    }

    @PostMapping(value = "/update-promotion/{id}")
    public String update_promotion(PromotionEntity promotion, Model model, @PathVariable long id,
                                   RedirectAttributes redirect) {
        if (promotion.getDecrease().equals("Giảm theo %")) {
            // kiểm tra giá theo % có hợp lệ k
            if (promotion.getMoneyDeals() >= 0 && promotion.getMoneyDeals() <= 100) {
                // kiểm tra ngày bắt đầu phải lớn hơn ngày hiện tại
                if (promotion.getStartDate().compareTo(LocalDate.now()) >= 0) {
                    // kiểm tra ngày kết thúc phải lớn hơn ngày bắt đầu
                    if (promotion.getEndDate().compareTo(promotion.getStartDate()) >= 0) {
                        promotionService.addPromotion(promotion);
                        redirect.addFlashAttribute("success", "Cập nhật khuyến mãi thành công!");
                        return "redirect:/admin/khuyenmai/capnhat/{id}";
                    } else {
                        redirect.addFlashAttribute("mes", "Ngày kết thúc phải lớn hơn ngày bắt đầu...!");
                        model.addAttribute("promotion", promotion);
                        model.addAttribute("decrease", decrease);
                        return "redirect:/admin/khuyenmai/capnhat/{id}";
                    }
                } else {
                    redirect.addFlashAttribute("mes", "Ngày bắt đầu phải lớn hơn ngày hiện tại...!");
                    model.addAttribute("promotion", promotion);
                    model.addAttribute("decrease", decrease);
                    return "redirect:/admin/khuyenmai/capnhat/{id}";
                }
            } else {
                redirect.addFlashAttribute("mes", "Mức giảm không hợp lệ...!");
                model.addAttribute("promotion", promotion);
                model.addAttribute("decrease", decrease);
                return "redirect:/admin/khuyenmai/capnhat/{id}";
            }
        } else {
            if (promotion.getMoneyDeals() >= 1000) {
                if (promotion.getStartDate().compareTo(LocalDate.now()) >= 0) {
                    if (promotion.getEndDate().compareTo(promotion.getStartDate()) >= 0) {
                        promotionService.addPromotion(promotion);
                        redirect.addFlashAttribute("success", "Cập nhật sản phẩm khuyến mãi thành công!");
                        return "redirect:/admin/khuyenmai/capnhat/{id}";
                    } else {
                        redirect.addFlashAttribute("mes", "Ngày kết thúc phải lớn hơn ngày bắt đầu...!");
                        model.addAttribute("promotion", promotion);
                        model.addAttribute("decrease", decrease);
                        return "redirect:/admin/khuyenmai/capnhat/{id}";
                    }
                } else {
                    redirect.addFlashAttribute("mes", "Ngày bắt đầu phải lớn hơn ngày hiện tại...!");
                    model.addAttribute("promotion", promotion);
                    model.addAttribute("decrease", decrease);
                    return "redirect:/admin/khuyenmai/capnhat/{id}";
                }
            } else {
                redirect.addFlashAttribute("mes", "Mức giảm không hợp lệ...!");
                model.addAttribute("promotion", promotion);
                model.addAttribute("decrease", decrease);
                return "redirect:/admin/khuyenmai/capnhat/{id}";
            }
        }
    }

    @GetMapping(value = "/khuyenmai/xoa/{id}")
    public String delete_promotion(@PathVariable(value = "id") long id,
                                   RedirectAttributes redirect) {
        promotionProductsService.deleteAllPromotionProduct();
        promotionService.deletePromotion(id);
        redirect.addFlashAttribute("success", "Xoá khuyến mãi thành công!");
        return "redirect:/admin/khuyenmai";
    }

    /*************************************** Sản phẩm khuyến mãi *********************************************/

    @GetMapping(value = "/{id}/themspkm")
    public String add_promotion_product(@PathVariable(value = "id") long id,Model model) {
        model.addAttribute("PromotionProduct", new PromotionProductsEntity());
        model.addAttribute("promotionID",id);
        setProduct(model);
        setPromotion(model);
        return "admin/promotion/add_promotion_product";
    }

    @GetMapping(value = "/sp_khuyenmai")
    public String view_promotion_product(HttpServletRequest request, Model model, RedirectAttributes redirect) {
        request.getSession().setAttribute("promotionProductList", null);
        if (model.asMap().get("success") != null)
            redirect.addFlashAttribute("success", model.asMap().get("success").toString());
        return "redirect:/admin/sp_khuyenmai/page/1";
    }

    @PostMapping(value = "/save-promotion-product/{id}")
    public String save_promotion_product(PromotionProductsEntity promotionProduct,
                                         Model model, RedirectAttributes redirect) {
        PromotionProductsEntity promotionProductsEntity = promotionProductsService.findByProduct_IdAndPromotion_Id(promotionProduct.getProduct().getId(), promotionProduct.getPromotion().getId());
        if (promotionProductsEntity != null) {
            redirect.addFlashAttribute("mes", "Sản phẩm này đã tồn tại trong khuyến mãi...!");
            model.addAttribute("PromotionProduct", new PromotionProductsEntity());
            setProduct(model);
            setPromotion(model);
            return "redirect:/admin/khuyenmai/capnhat/{id}";
        } else {
            promotionProductsService.addPromotionProduct(promotionProduct);
            redirect.addFlashAttribute("success", "Thêm sản phẩm khuyến mãi thành công!");
            return "redirect:/admin/khuyenmai/capnhat/{id}";
        }
    }

    @GetMapping(value = "/edit-PromotionProduct/{id}")
    public String edit_promotionProduct(@PathVariable(value = "id") long id, Model model) {
        PromotionProductsEntity promotionProduct = promotionProductsService.findById_Promotion_product(id);
        model.addAttribute("promotionProduct", promotionProduct);
        setPromotion(model);
        setProduct(model);
        model.addAttribute("id",id);
        return "admin/promotion/update_promotion_product";
    }

    @PostMapping(value = "/update-promotion-product/{id}")
    public String update_promotion_product(PromotionProductsEntity promotionProduct,@PathVariable long id,
                                           Model model, RedirectAttributes redirect) {
        PromotionProductsEntity promotionProductsEntity = promotionProductsService.findByProduct_IdAndPromotion_Id(promotionProduct.getProduct().getId(), promotionProduct.getPromotion().getId());
        if (promotionProductsEntity != null) {
            model.addAttribute("mes", "Sản phẩm này đã tồn tại trong hình thức khuyến mãi...!");
            model.addAttribute("promotionProduct", promotionProduct);
            setProduct(model);
            setPromotion(model);
            return "admin/promotion/update_promotion_product";
        } else {
            promotionProductsService.addPromotionProduct(promotionProduct);
            redirect.addFlashAttribute("success", "Cập nhật sản phẩm khuyến mãi thành công!");
            return "redirect:/admin/khuyenmai/capnhat/{id}";
        }
    }

    @GetMapping(value = "/{idKM}/delete-promotion-product/{id}")
    public String delete_promotion_product(@PathVariable(value = "id") long id,
                                           @PathVariable long idKM, RedirectAttributes redirect) {
        promotionProductsService.deletePromotionProduct(id);
        redirect.addFlashAttribute("success", "Xoá sản phẩm khuyến mãi thành công!");
        return "redirect:/admin/khuyenmai/capnhat/{idKM}";
    }
}
