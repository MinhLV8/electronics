package com.electronics.service;

import com.electronics.entity.AccountEntity;

import java.util.List;

public interface IAccountService {

    AccountEntity checkUsername(String name);

    AccountEntity findById(long id);

    AccountEntity addAccount(AccountEntity account);

    List<AccountEntity> findByOrderByIdDesc();

    List<AccountEntity> searchAccountName(String name);

}
