package com.electronics.entity;

import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

@Entity
@Table(name = "Orders")
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String email;

    private String phone;

    private String address;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dateOfBooking;

    private String status;

    private double totalMoney;

    @ManyToOne
    @JoinColumn(name = "accountID")
    private AccountEntity account;

    @ManyToOne
    @JoinColumn(name = "staffID")
    private StaffEntity staff;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private List<OrderDetailsEntity> orderDetailsList;

    public OrderEntity() {
    }

    public OrderEntity(Long id, String name, String email, String phone, String address, LocalDateTime dateOfBooking, String status, double totalMoney, AccountEntity account, StaffEntity staff, List<OrderDetailsEntity> orderDetailsList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.dateOfBooking = dateOfBooking;
        this.status = status;
        this.totalMoney = totalMoney;
        this.account = account;
        this.staff = staff;
        this.orderDetailsList = orderDetailsList;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getDateOfBooking() {
        return dateOfBooking;
    }

    public void setDateOfBooking(LocalDateTime dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }

    public StaffEntity getStaff() {
        return staff;
    }

    public void setStaff(StaffEntity staff) {
        this.staff = staff;
    }

    public List<OrderDetailsEntity> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetailsEntity> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public LocalDateTime localDateTime(){
        LocalDateTime localDate = LocalDateTime.now();
        return localDate;
    }

    public String formatDateOfBooking(){
        LocalDateTime localDateTime = dateOfBooking;
        String s = localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        return s;
    }

    public String formatTotalMoney(double price){
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String money = formatter.format(price);
        return money;
    }
}
