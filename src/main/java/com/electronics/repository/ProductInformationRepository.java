package com.electronics.repository;


import com.electronics.entity.ProductInformationEntity;
import com.electronics.entity.PromotionProductsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductInformationRepository extends JpaRepository<ProductInformationEntity, Long> {

    ProductInformationEntity findById(long id);

    ProductInformationEntity findByProduct_Id(long id);

    List<ProductInformationEntity> findAllByOrderByIdDesc();

    @Query(value = "select product_information.id,ram,color,guarantee,cpu,amd,\n" +
            " operating_System,productID \n" +
            " from product_information join product\n" +
            " on product_information.productID = product.id\n" +
            " where product.name like ?1", nativeQuery = true)
    List<ProductInformationEntity> searchProductInformation(String name);
}
