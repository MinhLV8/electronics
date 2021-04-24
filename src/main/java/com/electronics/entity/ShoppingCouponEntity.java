package com.electronics.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Shopping_Coupon")
public class ShoppingCouponEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String codes;
    private LocalDateTime start_Date;
    private LocalDateTime end_Date;

    public ShoppingCouponEntity() {
    }

}
