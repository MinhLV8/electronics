package com.electronics.repository;


import com.electronics.entity.CommentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentsRepository extends JpaRepository<CommentsEntity, Long> {

    List<CommentsEntity> findByProduct_Id(long id);

    List<CommentsEntity> findAll();
}
