package com.electronics.repository;


import com.electronics.entity.CategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends CrudRepository<CategoryEntity, Long> {

    List<CategoryEntity> findAll();

    List<CategoryEntity> findAllByOrderByIdDesc();

    List<CategoryEntity> findByNameLike(String name);

    CategoryEntity findById(long id);
}
