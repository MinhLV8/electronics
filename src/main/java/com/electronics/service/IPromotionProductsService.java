package com.electronics.service;

import com.electronics.entity.PromotionProductsEntity;

import java.util.List;

public interface IPromotionProductsService {

    List<PromotionProductsEntity> getAllPromotionProduct(long id);

    List<PromotionProductsEntity> getAllPromotionProductID(long id);

    List<PromotionProductsEntity> findByIdOrderByIdDesc();

    List<PromotionProductsEntity> findByPromotion_TitleLike(String name);

    PromotionProductsEntity findById_Promotion_product(long id);

    PromotionProductsEntity addPromotionProduct(PromotionProductsEntity promotionProduct);

    PromotionProductsEntity findByProduct_IdAndPromotion_Id(long idProduct, long idPromotion);

    boolean deletePromotionProduct(long id);

    boolean deleteAllPromotionProduct();

}
