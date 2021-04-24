package com.electronics.service;

import com.electronics.entity.OrderDetailsEntity;

import java.util.List;

public interface IOrderDetailsService {

    OrderDetailsEntity addOrderDetail(OrderDetailsEntity orderDetail);

    List<OrderDetailsEntity> findByOrder_Id(long id);

    List<OrderDetailsEntity> finByProduct_Id(long id);

    List<Object[]> revenueByCategory();
}
