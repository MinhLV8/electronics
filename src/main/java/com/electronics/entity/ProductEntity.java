package com.electronics.entity;


import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "product")
public class ProductEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private int quantity;

    private double price;

    @Column(name = "createddate")
    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime createdDate;

    @Column(name = "modifieddate")
    @LastModifiedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime modifiedDate;

    @ManyToOne
    @JoinColumn(name = "categoryID")
    private CategoryEntity category;

    @ManyToOne
    @JoinColumn(name = "brandID")
    private BrandEntity brand;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<ImageEntity> imageList;

    @OneToOne(mappedBy = "product", fetch = FetchType.EAGER)
    private ProductInformationEntity productInformation;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private List<OrderDetailsEntity> orderDetailsList;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<CouponDetailsEntity> couponDetailsList;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<CommentsEntity> commentsList;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<PromotionProductsEntity> promotionProductsList;

    public ProductEntity() {
    }

    public ProductEntity(Long id, String name, int quantity, double price, LocalDateTime createdDate, LocalDateTime modifiedDate, CategoryEntity category, BrandEntity brand, List<ImageEntity> imageList, ProductInformationEntity productInformation, List<OrderDetailsEntity> orderDetailsList, List<CouponDetailsEntity> couponDetailsList, List<CommentsEntity> commentsList, List<PromotionProductsEntity> promotionProductsList) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.createdDate = createdDate;
        this.modifiedDate = modifiedDate;
        this.category = category;
        this.brand = brand;
        this.imageList = imageList;
        this.productInformation = productInformation;
        this.orderDetailsList = orderDetailsList;
        this.couponDetailsList = couponDetailsList;
        this.commentsList = commentsList;
        this.promotionProductsList = promotionProductsList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public BrandEntity getBrand() {
        return brand;
    }

    public void setBrand(BrandEntity brand) {
        this.brand = brand;
    }

    public List<ImageEntity> getImageList() {
        return imageList;
    }

    public void setImageList(List<ImageEntity> imageList) {
        this.imageList = imageList;
    }

    public ProductInformationEntity getProductInformation() {
        return productInformation;
    }

    public void setProductInformation(ProductInformationEntity productInformation) {
        this.productInformation = productInformation;
    }

    public List<OrderDetailsEntity> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetailsEntity> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public List<CouponDetailsEntity> getCouponDetailsList() {
        return couponDetailsList;
    }

    public void setCouponDetailsList(List<CouponDetailsEntity> couponDetailsList) {
        this.couponDetailsList = couponDetailsList;
    }

    public List<CommentsEntity> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<CommentsEntity> commentsList) {
        this.commentsList = commentsList;
    }

    public List<PromotionProductsEntity> getPromotionProductsList() {
        return promotionProductsList;
    }

    public void setPromotionProductsList(List<PromotionProductsEntity> promotionProductsList) {
        this.promotionProductsList = promotionProductsList;
    }

    public String formatCreatedDate() {
        LocalDateTime localDateTime = createdDate;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        return s;
    }

    public String formatModifiedDate() {
        LocalDateTime localDateTime = modifiedDate;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        return s;
    }

    public double money_Deals(double money) {
        return price - (price * money / 100);
    }

    public double money_Deals1(double money) {
        return price * money / 100;
    }

    public String formatPrice() {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String money = formatter.format(price);
        return money;
    }

    public ImageEntity urlImage(ProductEntity product) {
        ImageEntity imageEntity = getImageList().get(0);
        for (int i = 0; i < getImageList().size(); i++) {
            if (getImageList().get(i).getId() == product.getId()) {
                imageEntity = getImageList().get(i);
            }
        }
        return imageEntity;
    }

    public double money_price(double money) {
        return price - money;
    }
}
