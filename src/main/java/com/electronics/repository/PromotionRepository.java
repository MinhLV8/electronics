package com.electronics.repository;


import com.electronics.entity.PromotionEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PromotionRepository extends CrudRepository<PromotionEntity, Long> {

    List<PromotionEntity> findByTitleLike(String name);

    PromotionEntity findById(long id);

    PromotionEntity findByTitle(String name);

    List<PromotionEntity> findByOrderByIdDesc();

    @Query(value = "select promotion.id,title,decrease,money_Deals,\n" +
            " start_Date,end_Date from promotion\n" +
            " join promotion_products on promotion.id = \n" +
            " promotion_products.promotionID join product on\n" +
            " promotion_products.productID = product.id\n" +
            " where start_Date <= now() and \n" +
            " end_Date >= now() and product.id = ?1 limit 1", nativeQuery = true)
    PromotionEntity getPromotion(Long id);

    @Query(value = "select distinct promotion.id,title,decrease,money_Deals,\n" +
            " start_Date,end_Date from promotion\n" +
            " join promotion_products on promotion.id = \n" +
            " promotion_products.promotionID join product on\n" +
            " promotion_products.productID = product.id\n" +
            " where start_Date <= now() and end_Date >= now() limit 1", nativeQuery = true)
    PromotionEntity getPromotion1();

    @Query(value = "select * from promotion order BY id desc limit 1", nativeQuery = true)
    PromotionEntity getIdDesc();

}
