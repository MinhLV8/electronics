package com.electronics.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Staff")
public class StaffEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String phone;

    private String address;

    private String position;

    @OneToMany(mappedBy = "staff", fetch = FetchType.LAZY)
    private List<OrderEntity> orderList;

    @OneToMany(mappedBy = "staff", fetch = FetchType.LAZY)
    private List<EnterCouponEntity> enterCouponList;

    @OneToOne
    @JoinColumn(name = "accountID")
    private AccountEntity account;

    public StaffEntity() {
    }

    public StaffEntity(Long id, String phone, String address, String position, List<OrderEntity> orderList, List<EnterCouponEntity> enterCouponList, AccountEntity account) {
        this.id = id;
        this.phone = phone;
        this.address = address;
        this.position = position;
        this.orderList = orderList;
        this.enterCouponList = enterCouponList;
        this.account = account;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public List<OrderEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrderEntity> orderList) {
        this.orderList = orderList;
    }

    public List<EnterCouponEntity> getEnterCouponList() {
        return enterCouponList;
    }

    public void setEnterCouponList(List<EnterCouponEntity> enterCouponList) {
        this.enterCouponList = enterCouponList;
    }

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }
}
