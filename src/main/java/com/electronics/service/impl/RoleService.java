package com.electronics.service.impl;

import com.electronics.entity.RoleEntity;
import com.electronics.repository.RoleRepository;
import com.electronics.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private RoleRepository roleRepo;

    @Override
    public RoleEntity getRoleName(String name) {
        return roleRepo.findByName(name);
    }
}
