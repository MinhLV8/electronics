package com.electronics.entity;

import javax.persistence.*;
import java.text.DecimalFormat;

@Entity
@Table(name = "OrderDetails")
public class OrderDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int quantity;

    private double unitPrice;

    @ManyToOne
    @JoinColumn(name = "orderID")
    private OrderEntity order;

    @ManyToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    public OrderDetailsEntity() {
    }

    public OrderDetailsEntity(Long id, int quantity, double unitPrice, OrderEntity order, ProductEntity product) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.order = order;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public OrderEntity getOrder() {
        return order;
    }

    public void setOrder(OrderEntity order) {
        this.order = order;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public double getMoneyTotal(){
        return quantity * unitPrice;
    }

    @Override
    public String toString() {
        return "Tên sản phẩm: "+ product.getName() +
                " - Số lượng: " + quantity +
                " - Thành tiền: "+ formatPrice(unitPrice) +" VNĐ \n" +
                "-----------------------------------------------\n";
    }

    public String formatPrice(double price){
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String money = formatter.format(price);
        return money;
    }
}
