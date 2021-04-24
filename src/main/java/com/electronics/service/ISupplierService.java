package com.electronics.service;

import com.electronics.entity.SupplierEntity;

import java.util.List;

public interface ISupplierService {
    SupplierEntity addSupplier(SupplierEntity supplier);

    List<SupplierEntity> findByOrderByIdDesc();

    SupplierEntity findByID(long id);

    List<SupplierEntity> searchSupplier(String name);

    boolean deleteSupplier(long id);
}
