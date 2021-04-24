package com.electronics.controller.web;

import com.electronics.entity.CategoryEntity;
import com.electronics.entity.ProductEntity;
import com.electronics.entity.PromotionEntity;
import com.electronics.service.*;
import com.electronics.service.impl.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Scope(value = "session")
public class CartItemController {
    @Autowired
    private Cart cart;

    @Autowired
    private IProductService productService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IPromotionService promotionService;

    @Autowired
    private IImageService imageService;

    @GetMapping(value = "/removeItem/{id}")
    public String removeItem(@PathVariable(value = "id") Long id) {
        ProductEntity getProductID = productService.getProductID(id);
        cart.removeItem(getProductID);
        return "redirect:/giohang";
    }

    @GetMapping(value = "/deleteItem/{id}")
    public String deleteItem(@PathVariable(value = "id") int id) {
        ProductEntity getProductID = productService.getProductID(id);
        cart.removeProduct(getProductID);
        return "redirect:/giohang";
    }

    @GetMapping(value = "/addItem/{id}")
    public String addItem(@PathVariable(value = "id") int id, RedirectAttributes redirect) {
        ProductEntity getProductID = productService.getProductID(id);
        if (cart.quantityProduct(getProductID) < getProductID.getQuantity()) {
            cart.addItem(getProductID);
        } else {
            redirect.addFlashAttribute("mes", "Không đủ số lượng");
        }
        return "redirect:/giohang";
    }

    @GetMapping(value = "/giohang")
    public String cartList(Model model, HttpSession session) {
        List<CategoryEntity> categoryList = categoryService.getCategoryName();
        List<ProductEntity> recentProducts = productService.recentProducts1();
        cart.getOrderDetailList();
        double totalMoney = cart.MoneyTotal();
        int quantityProduct = cart.countItem();
        if (quantityProduct == 0) {
            session.setAttribute("quantityProduct", quantityProduct);
            return "web/cart_empty";
        } else {
            session.setAttribute("quantityProduct", quantityProduct);
            model.addAttribute("cart", cart);
            model.addAttribute("totalMoney", totalMoney);
            model.addAttribute("categoryList", categoryList);
            model.addAttribute("recentProducts", recentProducts);
            model.addAttribute("imageService", imageService);
            return "web/cart";
        }
    }

    @GetMapping(value = "/cartItem-product/{id}")
    public String cartItem_product(@PathVariable(value = "id") int id,
                                   RedirectAttributes redirect) {
        ProductEntity getProductID = productService.getProductID(id);
        PromotionEntity getPromotion = promotionService.getPromotion(getProductID.getId());
        if (getProductID.getQuantity() > 0) {
            if (getPromotion != null) {
                if (getPromotion.getDecrease().equals("Giảm theo %")) {
                    double ss = getProductID.money_Deals(getPromotion.getMoneyDeals());
                    getProductID.setPrice(ss);
                    cart.addItem(getProductID);
                    return "redirect:/giohang";
                } else {
                    double ss = getProductID.money_price(getPromotion.getMoneyDeals());
                    getProductID.setPrice(ss);
                    cart.addItem(getProductID);
                    return "redirect:/giohang";
                }
            } else {
                cart.addItem(getProductID);
                return "redirect:/giohang";
            }
        } else {
            redirect.addFlashAttribute("mes", "Sản phẩm đã hết hàng...!");
            return "redirect:/chitietsanpham/{id}";
        }
    }
}
