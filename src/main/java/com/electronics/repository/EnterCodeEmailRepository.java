package com.electronics.repository;


import com.electronics.entity.ShoppingCouponEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnterCodeEmailRepository extends CrudRepository<ShoppingCouponEntity, Long> {
}
