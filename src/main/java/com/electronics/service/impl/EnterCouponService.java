package com.electronics.service.impl;

import com.electronics.entity.CouponDetailsEntity;
import com.electronics.entity.EnterCouponEntity;
import com.electronics.repository.EnterCouponRepository;
import com.electronics.service.IEnterCouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnterCouponService implements IEnterCouponService {

    @Autowired
    private EnterCouponRepository enterCouponRepository;

    @Override
    public EnterCouponEntity addEnterCoupon(EnterCouponEntity enterCoupon) {
        EnterCouponEntity newEnterCoupon;
        try {
            newEnterCoupon = enterCouponRepository.save(enterCoupon);
            return newEnterCoupon;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public EnterCouponEntity finByIdEnterCoupon(long id) {
        return enterCouponRepository.findById(id);
    }

    @Override
    public List<EnterCouponEntity> findByOrderByIdDesc() {
        List<EnterCouponEntity> list;
        try {
            list = enterCouponRepository.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean deleteEnterCoupon(long id) {
        boolean t = false;
        try {
            enterCouponRepository.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    public List<EnterCouponEntity> findBySupplier_NameLike(String name) {
        name = "%" + name + "%";
        return enterCouponRepository.findBySupplier_NameLike(name);
    }


}
