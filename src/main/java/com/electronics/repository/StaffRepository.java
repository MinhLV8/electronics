package com.electronics.repository;

import com.electronics.entity.StaffEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffRepository extends JpaRepository<StaffEntity, Long> {

    StaffEntity findByAccount_Id(long id);

    List<StaffEntity> findByOrderByIdDesc();

    StaffEntity findById(long id);

    List<StaffEntity> findByAccount_NameLikeOrAccount_UsernameLike(String name, String username);
}
