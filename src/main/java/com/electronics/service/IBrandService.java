package com.electronics.service;

import com.electronics.entity.BrandEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBrandService {
    List<BrandEntity> findAll();

    List<BrandEntity> findAllOrderByIdDesc();

    List<BrandEntity> getBrandName();

    Page<BrandEntity> finByNameLike(int nuberPage,String name);

    BrandEntity addBrand(BrandEntity brand);

    int getTotalItem();

    boolean deleteBrand(long id);

    BrandEntity findByBrandID(long id);
}
