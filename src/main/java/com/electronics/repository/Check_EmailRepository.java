package com.electronics.repository;

import com.electronics.entity.Check_EmailEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Check_EmailRepository extends CrudRepository<Check_EmailEntity, Long> {

    Check_EmailEntity findByCodeAndAccount_Id(String code, long id);

    List<Check_EmailEntity> findByAccount_Id(long id);
}
