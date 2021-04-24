package com.electronics.repository;


import com.electronics.entity.OrderDetailsEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailsRepository extends JpaRepository<OrderDetailsEntity, Long> {

    List<OrderDetailsEntity> findByOrder_Id(long id);

    List<OrderDetailsEntity> findByProduct_Id(long id);

    @Query(value="SELECT c.name,SUM(d.quantity),SUM(d.unit_price*d.quantity),MIN(d.unit_price),MAX(d.unit_price),AVG(d.unit_price) FROM order_details d " +
            "JOIN product p ON p.id = d.productid " +
            "JOIN category c ON p.categoryid = c.id " +
            "GROUP BY c.name;\n", nativeQuery = true)
    List<Object[]> revenueByCategory();
}
