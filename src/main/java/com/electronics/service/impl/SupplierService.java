package com.electronics.service.impl;

import com.electronics.entity.SupplierEntity;
import com.electronics.repository.SupplierRepository;
import com.electronics.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierService implements ISupplierService {
    @Autowired
    private SupplierRepository supplierRepo;

    public SupplierEntity addSupplier(SupplierEntity supplier) {
        SupplierEntity newSupplier;
        try {
            newSupplier = supplierRepo.save(supplier);
            return newSupplier;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<SupplierEntity> findByOrderByIdDesc() {
        List<SupplierEntity> list;
        try {
            list = supplierRepo.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public SupplierEntity findByID(long id) {
        return supplierRepo.findById(id);
    }

    @Override
    public List<SupplierEntity> searchSupplier(String name) {
        name = "%" + name + "%";
        return supplierRepo.findByNameLike(name);
    }

    @Override
    public boolean deleteSupplier(long id) {
        boolean t = false;
        try {
            supplierRepo.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }
}
