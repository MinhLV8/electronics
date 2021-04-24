package com.electronics.service.impl;

import com.electronics.constant.SystemConstant;
import com.electronics.entity.AccountEntity;
import com.electronics.entity.MyUser;
import com.electronics.entity.RoleEntity;
import com.electronics.repository.AccountRepository;
import com.electronics.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        AccountEntity account = accountRepository.findOneByUsername(userName);
        if (account == null) {
            System.out.println("User not found! " + userName);
            throw new UsernameNotFoundException(userName);
        }
        List<RoleEntity> roleNames = roleRepository.findByAccount_Username(userName);
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (!CollectionUtils.isEmpty(roleNames)) {
            for (RoleEntity role : roleNames) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getName());
                grantList.add(authority);
            }
        }
        MyUser myUser = new MyUser(account.getUsername(), account.getPassword(), true, true, true, true, grantList);
        myUser.setName(account.getName());
        return myUser;
    }
}
