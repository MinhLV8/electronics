package com.electronics.service.impl;

import com.electronics.entity.OrderDetailsEntity;
import com.electronics.repository.OrderDetailsRepository;
import com.electronics.service.IOrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailsService implements IOrderDetailsService {
    @Autowired
    OrderDetailsRepository orderDetailsRepository;

    @Override
    public OrderDetailsEntity addOrderDetail(OrderDetailsEntity orderDetail) {
        OrderDetailsEntity newOrder;
        try {
            newOrder = orderDetailsRepository.save(orderDetail);
            return newOrder;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderDetailsEntity> findByOrder_Id(long id) {
        List<OrderDetailsEntity> list;
        try {
            list = orderDetailsRepository.findByOrder_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderDetailsEntity> finByProduct_Id(long id) {
        List<OrderDetailsEntity> list;
        try {
            list = orderDetailsRepository.findByProduct_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByCategory() {
        try {
            return orderDetailsRepository.revenueByCategory();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
