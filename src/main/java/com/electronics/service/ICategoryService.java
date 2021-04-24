package com.electronics.service;

import com.electronics.entity.CategoryEntity;

import java.util.List;

public interface ICategoryService {

    List<CategoryEntity> findAll();

    List<CategoryEntity> findAllOrderByIdDesc();

    List<CategoryEntity> getCategoryName();

    List<CategoryEntity> finByNameLike(String name);

    CategoryEntity addCategory(CategoryEntity category);

    int getTotalItem();

    boolean deleteCategory(long id);

    CategoryEntity findByCategoryID(long id);

    //CategoryEntity findById(long id);

}
