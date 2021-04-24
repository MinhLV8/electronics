package com.electronics.service;

import com.electronics.entity.PromotionEntity;

import java.util.List;

public interface IPromotionService {
    PromotionEntity getPromotion(long id);

    PromotionEntity getIdDesc();

    PromotionEntity getPromotion1();

    List<PromotionEntity> getAllPromotion();

    List<PromotionEntity> findByTitleLike(String name);

    PromotionEntity addPromotion(PromotionEntity promotion);

    boolean deletePromotion(long id);

    PromotionEntity finById(long id);

    int getTotalItem();

    PromotionEntity findByTitle(String name);

}
