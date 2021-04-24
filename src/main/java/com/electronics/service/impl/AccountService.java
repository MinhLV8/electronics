package com.electronics.service.impl;

import com.electronics.entity.AccountEntity;
import com.electronics.repository.AccountRepository;
import com.electronics.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService implements IAccountService {

    @Autowired
    private AccountRepository accountRepo;

    @Override
    public AccountEntity checkUsername(String name) {
        AccountEntity check;
        try {
            check = accountRepo.findByUsername(name);
            return check;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public AccountEntity findById(long id) {
        AccountEntity check;
        try {
            check = accountRepo.findById(id);
            return check;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public AccountEntity addAccount(AccountEntity account) {
        AccountEntity newAccount;
        try {
            newAccount = accountRepo.save(account);
            return newAccount;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<AccountEntity> findByOrderByIdDesc() {
        List<AccountEntity> list;
        try {
            list = accountRepo.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<AccountEntity> searchAccountName(String name) {
        name = "%" + name + "%";
        return accountRepo.findByUsernameLike(name);
    }
}
