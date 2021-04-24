package com.electronics.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Supplier")
public class SupplierEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String phone;

    private String address;

    @OneToMany(mappedBy = "supplier", fetch = FetchType.LAZY)
    private List<EnterCouponEntity> enterCouponList;

    public SupplierEntity() {
    }

    public SupplierEntity(Long id, String name, String phone, String address, List<EnterCouponEntity> enterCouponList) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.enterCouponList = enterCouponList;
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

    public List<EnterCouponEntity> getEnterCouponList() {
        return enterCouponList;
    }

    public void setEnterCouponList(List<EnterCouponEntity> enterCouponList) {
        this.enterCouponList = enterCouponList;
    }
}
