package com.electronics.repository;


import com.electronics.entity.SupplierEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SupplierRepository extends CrudRepository<SupplierEntity, Long> {

    SupplierEntity findById(long id);

    boolean deleteById(long id);

    List<SupplierEntity> findByOrderByIdDesc();

    List<SupplierEntity> findByNameLike(String name);
}
