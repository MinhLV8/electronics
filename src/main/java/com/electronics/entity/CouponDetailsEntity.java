package com.electronics.entity;

import javax.persistence.*;

@Entity
@Table(name = "Coupon_Details")
public class CouponDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int quantity;

    private double unitPrice;

    @ManyToOne
    @JoinColumn(name = "couponID")
    private EnterCouponEntity enterCoupon;

    @ManyToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    public CouponDetailsEntity() {
    }

    public CouponDetailsEntity(Long id, int quantity, double unitPrice, EnterCouponEntity enterCoupon, ProductEntity product) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.enterCoupon = enterCoupon;
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

    public EnterCouponEntity getEnterCoupon() {
        return enterCoupon;
    }

    public void setEnterCoupon(EnterCouponEntity enterCoupon) {
        this.enterCoupon = enterCoupon;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public double totalCouponDetail(){
        return quantity * unitPrice;
    }
}
