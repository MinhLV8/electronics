package com.electronics.service.impl;

import com.electronics.entity.CouponDetailsEntity;
import com.electronics.repository.CouponDetailsRepository;
import com.electronics.service.ICouponDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponDetailsService implements ICouponDetailsService {

    @Autowired
    CouponDetailsRepository couponDetailsRepository;


    @Override
    public CouponDetailsEntity addCouponDetail(CouponDetailsEntity couponDetail) {
        CouponDetailsEntity newCouponDetail;
        try {
            newCouponDetail = couponDetailsRepository.save(couponDetail);
            return newCouponDetail;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public CouponDetailsEntity finByIdCouponDetail(long id) {
        return couponDetailsRepository.findById(id);
    }

    @Override
    public CouponDetailsEntity findByProduct_IdAndEnterCoupon_Id(long id, long idE) {
        return couponDetailsRepository.findByProduct_IdAndEnterCoupon_Id(id, idE);
    }

    @Override
    public List<CouponDetailsEntity> findByEnterCoupon_Id(long id) {
        List<CouponDetailsEntity> list;
        try {
            list = couponDetailsRepository.findByEnterCoupon_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean deleteACouponDetail(long id) {
        boolean t = false;
        try {
            couponDetailsRepository.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public List<CouponDetailsEntity> findByCouponDetailOrderByIdDesc() {
        List<CouponDetailsEntity> list;
        try {
            list = couponDetailsRepository.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CouponDetailsEntity> findByProduct_NameLike(String name) {
        name = "%" + name + "%";
        return couponDetailsRepository.findByProduct_NameLike(name);
    }
}
