package com.electronics.service.impl;

import com.electronics.entity.PromotionEntity;
import com.electronics.repository.PromotionRepository;
import com.electronics.service.IPromotionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PromotionService implements IPromotionService {

    @Autowired
    private PromotionRepository promotionRepo;

    @Override
    public int getTotalItem(){
        return (int) promotionRepo.count();
    }

    @Override
    public PromotionEntity getPromotion(long id) {
        return promotionRepo.getPromotion(id);
    }

    @Override
    public PromotionEntity getIdDesc() {
        PromotionEntity promotion;
        try {
            promotion = promotionRepo.getIdDesc();
            return promotion;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public PromotionEntity getPromotion1() {
        return promotionRepo.getPromotion1();
    }

    @Override
    public List<PromotionEntity> getAllPromotion() {
        List<PromotionEntity> list;
        try {
            list = promotionRepo.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<PromotionEntity> findByTitleLike(String name) {
        name = "%" + name + "%";
        return promotionRepo.findByTitleLike(name);
    }

    @Override
    public PromotionEntity addPromotion(PromotionEntity promotion) {
        PromotionEntity newPromotion;
        try {
            newPromotion = promotionRepo.save(promotion);
            return newPromotion;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean deletePromotion(long id) {
        boolean t = false;
        try {
            promotionRepo.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public PromotionEntity finById(long id) {
        return promotionRepo.findById(id);
    }

    @Override
    public PromotionEntity findByTitle(String name) {
        return promotionRepo.findByTitle(name);
    }

}
