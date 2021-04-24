package com.electronics.repository;


import com.electronics.entity.ImageEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Long> {

    @Query(value = "select * from image where productID = ?1 limit 4", nativeQuery = true)
    List<ImageEntity> getImageProduct(long id);

    @Query(value = "select * from  image where productID = ?1 limit 1", nativeQuery = true)
    ImageEntity urlImage(long id);

    List<ImageEntity> findByProduct_Id(long id);

    List<ImageEntity> findByOrderByIdDesc();

    @Query(value = "select image.id,url,productID from image\n" +
            " join product on image.productID = product.id\n" +
            " where product.name like ?1", nativeQuery = true)
    List<ImageEntity> findByProduct_NameLike(String name);

    ImageEntity findById(long id);
}
