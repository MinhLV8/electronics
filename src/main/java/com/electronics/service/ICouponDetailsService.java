package com.electronics.service;

import com.electronics.entity.CouponDetailsEntity;
import com.electronics.entity.PromotionProductsEntity;

import java.util.List;

public interface ICouponDetailsService {

    CouponDetailsEntity addCouponDetail(CouponDetailsEntity couponDetail);

    CouponDetailsEntity finByIdCouponDetail(long id);

    List<CouponDetailsEntity> findByEnterCoupon_Id(long id);

    boolean deleteACouponDetail(long id);

    CouponDetailsEntity findByProduct_IdAndEnterCoupon_Id(long idProduct, long idConpon);

    List<CouponDetailsEntity> findByCouponDetailOrderByIdDesc();

    public List<CouponDetailsEntity> findByProduct_NameLike(String name);
}
