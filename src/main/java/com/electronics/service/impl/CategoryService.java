package com.electronics.service.impl;

import com.electronics.entity.CategoryEntity;
import com.electronics.repository.CategoryRepository;
import com.electronics.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<CategoryEntity> findAll() {
        List<CategoryEntity> list;
        try {
            list = categoryRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CategoryEntity> findAllOrderByIdDesc() {
        List<CategoryEntity> list;
        try {
            list = categoryRepository.findAllByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CategoryEntity> getCategoryName() {
        List<CategoryEntity> list;
        try {
            list = (List<CategoryEntity>) categoryRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CategoryEntity> finByNameLike(String name) {
        name = "%" + name + "%";
        return categoryRepository.findByNameLike(name);
    }

    @Override
    public CategoryEntity addCategory(CategoryEntity category) {
        CategoryEntity newCategory;
        try {
            newCategory = categoryRepository.save(category);
            return newCategory;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getTotalItem() {
        return (int) categoryRepository.count();
    }

    @Override
    public boolean deleteCategory(long id) {
        boolean t = false;
        try {
            categoryRepository.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public CategoryEntity findByCategoryID(long id) {
        return categoryRepository.findById(id);
    }

    /*@Override
    public CategoryEntity findById(long id) {
        return null;
    }*/


}
