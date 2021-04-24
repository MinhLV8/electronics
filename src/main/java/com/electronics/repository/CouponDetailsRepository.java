package com.electronics.repository;


import com.electronics.entity.CouponDetailsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CouponDetailsRepository extends CrudRepository<CouponDetailsEntity, Long> {

    CouponDetailsEntity findById(long id);

    List<CouponDetailsEntity> findByOrderByIdDesc();

    List<CouponDetailsEntity> findByEnterCoupon_Id(long id);

    List<CouponDetailsEntity> findByProduct_NameLike(String id);

    CouponDetailsEntity findByProduct_IdAndEnterCoupon_Id(long id, long idE);
}
