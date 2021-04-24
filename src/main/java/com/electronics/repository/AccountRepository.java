package com.electronics.repository;


import com.electronics.entity.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, Long> {

    AccountEntity findOneByUsername(String name);

    AccountEntity findByUsername(String name);

    List<AccountEntity> findByOrderByIdDesc();

    List<AccountEntity> findByUsernameLike(String name);

    AccountEntity findById(long id);

}
