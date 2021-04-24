package com.electronics.service;

import com.electronics.entity.OrderEntity;

import java.util.List;

public interface IOrderService {

    List<OrderEntity> findAll();

    OrderEntity addOrder(OrderEntity order);

    List<OrderEntity> findByAccount_Id(long id);

    List<OrderEntity> findByOrderByIdDesc();

    List<OrderEntity> findByDateOfBookingDesc();

    List<OrderEntity> searchOrder(String name);

    OrderEntity findById(long id);

    Double sumMoneyOrder(String startDate, String endDate);

    Double sumMoney();

    List<OrderEntity> order_success();

    List<OrderEntity> order_failed();

    List<OrderEntity> search_order_success(String startDate, String endDate);

    List<OrderEntity> search_order_failed(String startDate, String endDate);

    List<Object[]> revenueByYear();

    List<Object[]> revenueByQuarter();

    List<Object[]> revenueByMonth();

    List<Object[]> revenueByCustomer();

    List<Object[]> revenueByWeek();

}
