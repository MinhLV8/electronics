package com.electronics.repository;

import com.electronics.entity.BrandEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BrandRepository extends JpaRepository<BrandEntity, Long> {

    List<BrandEntity> findAllByOrderByIdDesc();

    Page<BrandEntity> findByNameLike(Pageable pageable,String name);

    BrandEntity findById(long id);
}
