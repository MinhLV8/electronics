package com.electronics.repository;


import com.electronics.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {

    List<OrderEntity> findAll();

    List<OrderEntity> findByOrderByIdDesc();

    List<OrderEntity> findAllByOrderByDateOfBookingDesc();

    OrderEntity findById(long id);

    List<OrderEntity> findByAccount_IdOrderByIdDesc(long id);

    @Query(value = "SELECT DATE_ADD(?1, INTERVAL 1 DAY)", nativeQuery = true)
    LocalDateTime getDate_of_Booking(String date);

    @Query(value = "select orders.id,accountID,name,email,phone,address\n" +
            ",date_Of_Booking,status,staffID,total_Money\n" +
            " from orders join accounts\n" +
            " on orders.accountID = accounts.id\n" +
            " where accounts.username like ?1 or \n" +
            " name like ?2 or email like ?3 \n" +
            " or phone like ?4", nativeQuery = true)
    List<OrderEntity> searchOrder(String username, String name, String email, String phone);

    @Query(value = "select totalMoneyOrder(?1,?2)", nativeQuery = true)
    Double sumMoneyOrder(String startDate, String endDate);

    @Query(value = "select sum(o.total_money) from orders o where o.status='Thành công'", nativeQuery = true)
    Double sumMoney();

    @Query(value = "select * from orders where status = 'Thành công'", nativeQuery = true)
    List<OrderEntity> order_success();

    @Query(value = "select * from orders where status = 'Thất bại'", nativeQuery = true)
    List<OrderEntity> order_failed();

    @Query(value = "select * from orders where status = 'Thành công' " +
            "and date_Of_Booking between ?1 and ?2", nativeQuery = true)
    List<OrderEntity> search_order_success(String startDate, String endDate);

    @Query(value = "select * from orders where status = 'Thất bại' " +
            "and date_Of_Booking between ?1 and ?2", nativeQuery = true)
    List<OrderEntity> search_order_failed(String startDate, String endDate);

    @Query(value = "select year(d.date_of_booking),count(DISTINCT o.orderid),sum(DISTINCT d.total_money),sum(o.quantity),count(DISTINCT o.productid)\n" +
            "from orders d join order_details o on o.orderid = d.id\n" +
            "WHERE d.status = 'Thành công'\n" +
            "group by year(d.date_of_booking)\n" +
            "order by year(d.date_of_booking),d.id desc;", nativeQuery = true)
    List<Object[]> revenueByYear();

    @Query(value = "SELECT QUARTER(d.date_of_booking),count(DISTINCT o.orderid),sum(DISTINCT d.total_money),sum(o.quantity)\n" +
            "FROM orders d join order_details o on o.orderid = d.id\n" +
            "WHERE d.status = 'Thành công'\n" +
            "GROUP BY QUARTER(d.date_of_booking)\n" +
            "ORDER BY QUARTER(d.date_of_booking);", nativeQuery = true)
    List<Object[]> revenueByQuarter();

    @Query(value = "select month(d.date_of_booking),count(DISTINCT o.orderid),sum(DISTINCT d.total_money),sum(o.quantity),count(DISTINCT o.productid)\n" +
            "from orders d join order_details o on o.orderid = d.id\n" +
            "WHERE d.status = 'Thành công'\n" +
            "group by month(d.date_of_booking)\n" +
            "order by month(d.date_of_booking),d.id desc;", nativeQuery = true)
    List<Object[]> revenueByMonth();

    @Query(value = "SELECT a.name,count(DISTINCT o.orderid),sum(DISTINCT d.total_money),sum(o.quantity)\n" +
            "FROM orders d join order_details o on o.orderid = d.id\n" +
            "join accounts a on d.accountid = a.id\n" +
            "WHERE d.status = 'Thành công'\n" +
            "GROUP BY a.name;", nativeQuery = true)
    List<Object[]> revenueByCustomer();

    @Query(value="select dayofweek(d.date_of_booking),count(DISTINCT o.orderid),sum(DISTINCT d.total_money)\n" +
            "from orders d\n" +
            "join order_details o on d.id = o.orderid\n" +
            "where week(d.date_of_booking) = week(now()) and month(now()) and year(now()) and d.status = 'Thành công'\n" +
            "group by dayofweek(d.date_of_booking);",nativeQuery = true)
    List<Object[]> revenueByWeek();

}
