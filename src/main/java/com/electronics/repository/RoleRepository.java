package com.electronics.repository;

import com.electronics.entity.RoleEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends CrudRepository<RoleEntity, Long> {

    List<RoleEntity> findByAccount_Username(String name);

    RoleEntity findByName(String role);

    RoleEntity findById(String id);
}
