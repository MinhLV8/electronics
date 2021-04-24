package com.electronics.service;

import com.electronics.entity.ProductEntity;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IProductService {

    List<ProductEntity> findAll();

    List<ProductEntity> findAllByOrderByIdDesc();

    List<ProductEntity> getAllProduct();

    List<ProductEntity> searchProductName(String name);

    List<ProductEntity> searchCategoryName(String name);

    List<ProductEntity> searchBrandName(String name);

    List<ProductEntity> recentProducts();

    List<ProductEntity> recentProducts1();

    List<ProductEntity> sellingProducts();

    List<ProductEntity> sellingProducts1();

    List<ProductEntity> productPromotion();

    ProductEntity getProductID(long id);

    List<ProductEntity> search1To5();

    List<ProductEntity> search5To10();

    List<ProductEntity> search10To15();

    List<ProductEntity> search15To20();

    List<ProductEntity> search20To25();

    List<ProductEntity> searchTo25();

    List<ProductEntity> searchTo5();

    int getTotalItem();

    ProductEntity addProduct(ProductEntity productEntity);

    ProductEntity updateProduct(ProductEntity productEntity);

    boolean delete(Long id);

    void delete(Long[] ids);

    List<Object[]> inventoryCat();

    List<Object[]> inventoryBrand();

    List<Object[]> inventoryProduct();

    List<Object[]> statisticsProduct();

    List<ProductEntity> outOfStock();


}
