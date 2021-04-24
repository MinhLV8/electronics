package com.electronics.service.impl;

import com.electronics.entity.BrandEntity;
import com.electronics.repository.BrandRepository;
import com.electronics.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandService implements IBrandService {

    @Autowired
    BrandRepository brandRepository;

    @Override
    public List<BrandEntity> findAll() {
        List<BrandEntity> list;
        try {
            list = brandRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<BrandEntity> findAllOrderByIdDesc() {
       /* Pageable pageable = PageRequest.of();*/
        /*List<BrandEntity> list;*/
        try {
            return brandRepository.findAllByOrderByIdDesc();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<BrandEntity> getBrandName() {
        List<BrandEntity> list;
        try {
            list = brandRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Page<BrandEntity> finByNameLike(int pageNumber,String name) {
        name = "%" + name + "%";
        Pageable pageable = PageRequest.of(pageNumber - 1, 10);
        return brandRepository.findByNameLike(pageable,name);
    }

    @Override
    public BrandEntity addBrand(BrandEntity brand) {
        BrandEntity newBrand;
        try {
            newBrand = brandRepository.save(brand);
            return newBrand;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getTotalItem() {
        return (int) brandRepository.count();
    }

    @Override
    public boolean deleteBrand(long id) {
        boolean t = false;
        try {
            brandRepository.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public BrandEntity findByBrandID(long id) {
        return brandRepository.findById(id);
    }
}
