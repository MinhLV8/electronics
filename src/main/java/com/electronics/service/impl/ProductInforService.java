package com.electronics.service.impl;

import com.electronics.entity.ProductInformationEntity;
import com.electronics.repository.ProductInformationRepository;
import com.electronics.service.IProductInforService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductInforService implements IProductInforService {


    @Autowired
    private ProductInformationRepository productInformationRepository;


    @Override
    public List<ProductInformationEntity> findAll() {
        return null;
    }

    @Override
    public List<ProductInformationEntity> findAllByOrderByIdDesc() {
        List<ProductInformationEntity> list;
        try {
            list = productInformationRepository.findAllByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public ProductInformationEntity addProductInformation(ProductInformationEntity productInformation) {
        ProductInformationEntity newProductInformation;
        try {
            newProductInformation = productInformationRepository.save(productInformation);
            return newProductInformation;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public ProductInformationEntity getProductInformation(long id) {
        return productInformationRepository.findByProduct_Id(id);
    }

    @Override
    public ProductInformationEntity getProductInformation_productID(long id) {
        return productInformationRepository.findByProduct_Id(id);
    }

    @Override
    public List<ProductInformationEntity> searchProductInformation(String name) {
        name = "%" + name + "%";
        return productInformationRepository.searchProductInformation(name);
    }

    @Override
    public boolean delete(Long id) {
        try {
            productInformationRepository.deleteById(id);
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public ProductInformationEntity getProductInformationID(long id) {
        return productInformationRepository.findById(id);
    }
}
