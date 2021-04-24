package com.electronics.service;

import com.electronics.entity.ProductInformationEntity;

import java.util.List;
public interface IProductInforService {

    List<ProductInformationEntity> findAll();

    List<ProductInformationEntity> findAllByOrderByIdDesc();

    ProductInformationEntity addProductInformation(ProductInformationEntity productInformation);

    ProductInformationEntity getProductInformation(long id);

    ProductInformationEntity getProductInformation_productID(long id);

    List<ProductInformationEntity> searchProductInformation(String name);

    boolean delete(Long id);

    ProductInformationEntity getProductInformationID(long id);
}
