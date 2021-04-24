package com.electronics.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name = "Promotion")
public class PromotionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String decrease;

    @Column(length = '2')
    private int moneyDeals;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    @OneToMany(mappedBy = "promotion", fetch = FetchType.EAGER)
    private List<PromotionProductsEntity> promotionProductsList;

    public PromotionEntity() {
    }

    public PromotionEntity(Long id, String title, String decrease, int moneyDeals, LocalDate startDate, LocalDate endDate, List<PromotionProductsEntity> promotionProductsList) {
        this.id = id;
        this.title = title;
        this.decrease = decrease;
        this.moneyDeals = moneyDeals;
        this.startDate = startDate;
        this.endDate = endDate;
        this.promotionProductsList = promotionProductsList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDecrease() {
        return decrease;
    }

    public void setDecrease(String decrease) {
        this.decrease = decrease;
    }

    public int getMoneyDeals() {
        return moneyDeals;
    }

    public void setMoneyDeals(int moneyDeals) {
        this.moneyDeals = moneyDeals;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public List<PromotionProductsEntity> getPromotionProductsList() {
        return promotionProductsList;
    }

    public void setPromotionProductsList(List<PromotionProductsEntity> promotionProductsList) {
        this.promotionProductsList = promotionProductsList;
    }

    public String formatEndDate(){
        LocalDate localDateTime = endDate;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        return s;
    }
    public String formatStartDate(){
        LocalDate localDateTime = startDate;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        return s;
    }

    public LocalDateTime getLocalDateTime(){
        LocalDateTime localDateTime = LocalDateTime.now();
        return localDateTime;
    }

    public int formatDiscount(){
        return (int)moneyDeals;
    }

}
