package com.electronics.repository;


import com.electronics.entity.PromotionProductsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PromotionProductsRepository extends CrudRepository<PromotionProductsEntity, Long> {

    List<PromotionProductsEntity> findByPromotion_IdOrderByIdDesc(long id);

    List<PromotionProductsEntity> findByProduct_Id(long id);

    List<PromotionProductsEntity> findByOrderByIdDesc();

    List<PromotionProductsEntity> findByPromotion_TitleLike(String name);

    PromotionProductsEntity findByProduct_IdAndPromotion_Id(long idProduct, long idPromotion);

    //PromotionProductsEntity findOneById(Long id);

    PromotionProductsEntity findById(long id);
}
