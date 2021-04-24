package com.electronics.entity;

import javax.persistence.*;

@Entity
@Table(name = "Promotion_Products")
public class PromotionProductsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "promotionID")
    private PromotionEntity promotion;

    @ManyToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    public PromotionProductsEntity() {
    }

    public PromotionProductsEntity(Long id, PromotionEntity promotion, ProductEntity product) {
        this.id = id;
        this.promotion = promotion;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }
}
