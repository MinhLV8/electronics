package com.electronics.service;

import com.electronics.entity.EnterCouponEntity;

import java.util.List;

public interface IEnterCouponService {

    EnterCouponEntity addEnterCoupon(EnterCouponEntity enterCoupon);

    EnterCouponEntity finByIdEnterCoupon(long id);

    List<EnterCouponEntity> findByOrderByIdDesc();

    boolean deleteEnterCoupon(long id);

    List<EnterCouponEntity> findBySupplier_NameLike(String name);

}
