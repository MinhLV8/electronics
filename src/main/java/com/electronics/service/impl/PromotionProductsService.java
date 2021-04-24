package com.electronics.service.impl;

import com.electronics.entity.PromotionProductsEntity;
import com.electronics.repository.PromotionProductsRepository;
import com.electronics.service.IPromotionProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PromotionProductsService implements IPromotionProductsService {

    @Autowired
    PromotionProductsRepository promotionProductsRepo;

    @Override
    public List<PromotionProductsEntity> getAllPromotionProduct(long id) {
        List<PromotionProductsEntity> list;
        try {
            list = promotionProductsRepo.findByPromotion_IdOrderByIdDesc(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<PromotionProductsEntity> getAllPromotionProductID(long id) {
        List<PromotionProductsEntity> list;
        try {
            list = promotionProductsRepo.findByProduct_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public PromotionProductsEntity addPromotionProduct(PromotionProductsEntity promotionProduct) {
        PromotionProductsEntity newPromotionProduct;
        try {
            newPromotionProduct = promotionProductsRepo.save(promotionProduct);
            return newPromotionProduct;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<PromotionProductsEntity> findByIdOrderByIdDesc() {
        List<PromotionProductsEntity> list;
        try {
            list = promotionProductsRepo.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<PromotionProductsEntity> findByPromotion_TitleLike(String name) {
        name = "%" + name + "%";
        return promotionProductsRepo.findByPromotion_TitleLike(name);
    }

    @Override
    public PromotionProductsEntity findByProduct_IdAndPromotion_Id(long idProduct, long idPromotion) {
        return promotionProductsRepo.findByProduct_IdAndPromotion_Id(idProduct, idPromotion);
    }

    @Override
    public boolean deletePromotionProduct(long id) {
        boolean t = false;
        try {
            promotionProductsRepo.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public boolean deleteAllPromotionProduct() {
        boolean t = false;
        try {
            promotionProductsRepo.deleteAll();
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public PromotionProductsEntity findById_Promotion_product(long id) {
        return promotionProductsRepo.findById(id);
    }
}
