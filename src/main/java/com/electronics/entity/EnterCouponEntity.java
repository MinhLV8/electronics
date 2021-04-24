package com.electronics.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Entity
@Table(name = "Enter_Coupon")
public class EnterCouponEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dateAdded;

    private double totalMoney;

    @ManyToOne
    @JoinColumn(name = "supplierID")
    private SupplierEntity supplier;

    @ManyToOne
    @JoinColumn(name = "staffID")
    private StaffEntity staff;

    @OneToMany(mappedBy = "enterCoupon", fetch = FetchType.EAGER)
    private List<CouponDetailsEntity> couponDetailsList;

    public EnterCouponEntity() {
    }

    public EnterCouponEntity(Long id, LocalDateTime dateAdded, double totalMoney, SupplierEntity supplier, StaffEntity staff, List<CouponDetailsEntity> couponDetailsList) {
        this.id = id;
        this.dateAdded = dateAdded;
        this.totalMoney = totalMoney;
        this.supplier = supplier;
        this.staff = staff;
        this.couponDetailsList = couponDetailsList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public SupplierEntity getSupplier() {
        return supplier;
    }

    public void setSupplier(SupplierEntity supplier) {
        this.supplier = supplier;
    }

    public StaffEntity getStaff() {
        return staff;
    }

    public void setStaff(StaffEntity staff) {
        this.staff = staff;
    }

    public List<CouponDetailsEntity> getCouponDetailsList() {
        return couponDetailsList;
    }

    public void setCouponDetailsList(List<CouponDetailsEntity> couponDetailsList) {
        this.couponDetailsList = couponDetailsList;
    }

    public String formatDateAdded(){
        LocalDateTime localDateTime = dateAdded;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        return s;
    }

    public double moneyCoupon(EnterCouponEntity enterCoupon){
        double sum= 0;
        for (int i = 0; i < couponDetailsList.size(); i++){
            if(couponDetailsList.get(i).getEnterCoupon().getId() == enterCoupon.getId()){
                sum += couponDetailsList.get(i).getUnitPrice();
            }
        }
        return sum;
    }
}
