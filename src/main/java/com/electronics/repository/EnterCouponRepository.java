package com.electronics.repository;


import com.electronics.entity.CouponDetailsEntity;
import com.electronics.entity.EnterCouponEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnterCouponRepository extends CrudRepository<EnterCouponEntity, Long> {

    EnterCouponEntity findById(long id);

    List<EnterCouponEntity> findByOrderByIdDesc();

    List<EnterCouponEntity> findBySupplier_NameLike(String name);
}
