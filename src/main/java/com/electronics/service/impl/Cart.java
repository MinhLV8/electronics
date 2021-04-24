package com.electronics.service.impl;

import com.electronics.entity.OrderDetailsEntity;
import com.electronics.entity.ProductEntity;
import com.electronics.entity.PromotionEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = "session")
public class Cart {

    @Autowired
    private PromotionService promotionService;

    private List<OrderDetailsEntity> orderDetailList;

    public Cart() {
        orderDetailList = new ArrayList<>();
    }

    public List<OrderDetailsEntity> getOrderDetailList() {
        return orderDetailList;
    }

    public void addItem(ProductEntity product) {
        boolean t = false;
        for (int i = 0; i < orderDetailList.size(); i++) {
            if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                OrderDetailsEntity orderDetails = orderDetailList.get(i);
                orderDetails.setQuantity(orderDetails.getQuantity() + 1);
                orderDetailList.set(i, orderDetails);
                t = true;
            }
        }
        if (!t) {
            OrderDetailsEntity orderDetails = new OrderDetailsEntity();
            orderDetails.setProduct(product);
            orderDetails.setQuantity(1);
            orderDetails.setUnitPrice(product.getPrice());
            orderDetailList.add(orderDetails);
        }
    }

    //  giảm số lượng product
    public void removeItem(ProductEntity product) {
        for (int i = 0; i < orderDetailList.size(); i++) {
            if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                if (orderDetailList.get(i).getQuantity() > 1) {
                    orderDetailList.get(i).setQuantity(orderDetailList.get(i).getQuantity() - 1);
                    break;
                }
            }
        }
    }

    // xóa sản phẩm
    public void removeProduct(ProductEntity product) {
        for (int i = 0; i < orderDetailList.size(); i++) {
            if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                orderDetailList.remove(i);
            }
        }
    }

    // đếm số sản phẩm trong giỏ
    public int countItem() {
        int count = 0;
        for (int i = 0; i < orderDetailList.size(); i++) {
            count += 1;
        }
        return count;
    }

    // tính tổng tiền giỏ hàng
    public double MoneyTotal() {
        double sum = 0;
        for (int i = 0; i < orderDetailList.size(); i++) {
            sum += orderDetailList.get(i).getMoneyTotal();
        }
        return sum;
    }

    // lấy ra số lượng sản phẩm trong giỏ hàng
    public int quantityProduct(ProductEntity product) {
        int s = 0;
        for (int i = 0; i < orderDetailList.size(); i++) {
            if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                s += orderDetailList.get(i).getQuantity();
            }
        }
        return s;
    }

    // lay san pham trong gio hang
    public ProductEntity getProduct(ProductEntity product) {
        ProductEntity productEntity = null;
        for (int i = 0; i < orderDetailList.size(); i++) {
            if (orderDetailList.get(i).getProduct().getId() == product.getId()) {
                productEntity = orderDetailList.get(i).getProduct();
            }
        }
        return productEntity;
    }

    public void emptyCart(List<OrderDetailsEntity> orderDetailList) {
        orderDetailList.clear();
    }

    public String formatPrice(double price) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String money = formatter.format(price);
        return money;
    }

    public double getPrice(double price, int quantity, double s) {
        return (price * quantity) * s / 100;
    }

    public double get() {
        double sum = 0;
        for (int i = 0; i < orderDetailList.size(); i++) {
            PromotionEntity promotion =
                    promotionService.getPromotion(orderDetailList.get(i).getProduct().getId());
            if (promotion != null) {
                sum += getPrice(orderDetailList.get(i).getUnitPrice(),
                        orderDetailList.get(i).getQuantity(), promotion.getMoneyDeals());
            }
        }
        return sum;
    }

}
