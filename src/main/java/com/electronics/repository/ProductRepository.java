package com.electronics.repository;


import com.electronics.entity.ProductEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Long> {

    List<ProductEntity> findAllByOrderByIdDesc();

    ProductEntity findById(long id);

    @Query(value = "select * from product where name like ?1", nativeQuery = true)
    List<ProductEntity> searchNameLike(String name);

    @Query(value = "select product.id,product.name,quantity,product.createdby,product.createddate,product.modifiedby,product.modifieddate,\n" +
            "             price,categoryID,brandID\n" +
            "             from product join category\n" +
            "             on product.categoryID = category.id\n" +
            "             where category.name = ?1;", nativeQuery = true)
    List<ProductEntity> searchByCategoryName(String name);

    List<ProductEntity> findAllByCategory_Name(String name);

    List<ProductEntity> findAllByBrandName(String name);

    @Query(value = "select * from product order by id desc limit 8", nativeQuery = true)
    List<ProductEntity> recentProducts();

    @Query(value = "select * from product order by id desc limit 3", nativeQuery = true)
    List<ProductEntity> recentProducts1();

    @Query(value = "select product.id,product.name,product.quantity,product.brandID,product.createddate,\n" +
            " price,categoryID\n" +
            " from product join order_details \n" +
            " on product.id = order_details.productID\n" +
            " group by product.id\n" +
            " order by sum(order_details.quantity) desc \n" +
            " limit 8", nativeQuery = true)
    List<ProductEntity> sellingProducts();

    @Query(value = "select product.id,product.name,product.quantity,product.brandID,product.createddate,product.modifieddate,\n" +
            " price,categoryID\n" +
            " from product join order_details \n" +
            " on product.id = order_details.productID\n" +
            " group by product.id\n" +
            " order by sum(order_details.quantity) desc \n" +
            " limit 4", nativeQuery = true)
    List<ProductEntity> sellingProducts1();

    @Query(value = "select product.id,product.name,product.quantity,product.brandID,\n" +
            " price,categoryID\n" +
            " from product join promotion_products\n" +
            " on product.id = promotion_products.productID\n" +
            " join  promotion on \n" +
            " promotion.id = promotion_products.promotionID\n" +
            " where start_Date <= now() and end_Date >= now()", nativeQuery = true)
    List<ProductEntity> promotion_Product();

    @Query(value = "select * from product where quantity = 0", nativeQuery = true)
    List<ProductEntity> getProductQuantity();

    @Query(value = "select * from product where price between 1000000 and 5000000 order by id desc", nativeQuery = true)
    List<ProductEntity> search1To5();

    @Query(value = "select * from product where price between 5000000 and 10000000 order by id desc", nativeQuery = true)
    List<ProductEntity> search5To10();

    @Query(value = "select * from product where price between 10000000 and 15000000 order by id desc", nativeQuery = true)
    List<ProductEntity> search10To15();

    @Query(value = "select * from product where price between 15000000 and 20000000 order by id desc", nativeQuery = true)
    List<ProductEntity> search15To20();

    @Query(value = "select * from product where price between 20000000 and 25000000 order by id desc", nativeQuery = true)
    List<ProductEntity> search20To25();

    @Query(value = "select * from product where price > 25000000 order by id desc", nativeQuery = true)
    List<ProductEntity> searchTo25();

    @Query(value = "select * from product where price < 5000000 order by id desc", nativeQuery = true)
    List<ProductEntity> searchTo5();

    @Query(value = "SELECT c.name,SUM(p.quantity),SUM(p.price*p.quantity),MIN(p.price),MAX(p.price),AVG(p.price) " +
            "FROM Product p join category c on c.id = p.categoryid " +
            "where p.id not in (Select order_details.productid from order_details)" +
            "GROUP BY c.name;", nativeQuery = true)
    List<Object[]> inventoryCat();

    @Query(value = "SELECT b.name,SUM(p.quantity),SUM(p.price*p.quantity),MIN(p.price),MAX(p.price),AVG(p.price) " +
            "FROM Product p join brand b on b.id = p.brandid " +
            "where p.id not in (Select order_details.productid from order_details)" +
            "GROUP BY b.name;", nativeQuery = true)
    List<Object[]> inventoryBrand();

    @Query(value = "SELECT p.name,SUM(p.quantity),SUM(p.price*p.quantity),MIN(p.price),MAX(p.price),AVG(p.price) \n" +
            "FROM Product p \n" +
            "where p.id not in (Select order_details.productid from order_details)\n" +
            "GROUP BY p.name;", nativeQuery = true)
    List<Object[]> inventoryProduct();

    @Query(value = "select c.name,count(p.id)\n" +
            "from product p\n" +
            "join category c on p.categoryid = c.id\n" +
            "group by c.name",nativeQuery = true)
    List<Object[]> statisticsProduct();

    @Query(value = "select * from product p where p.quantity <= 10",nativeQuery = true)
    List<ProductEntity> outOfStock();

}
