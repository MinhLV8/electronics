package com.electronics.service.impl;

import com.electronics.entity.CategoryEntity;
import com.electronics.entity.OrderEntity;
import com.electronics.repository.OrderRepository;
import com.electronics.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Autowired
    OrderRepository orderRepository;

    @Override
    public List<OrderEntity> findAll() {
        List<OrderEntity> list;
        try {
            list = orderRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public OrderEntity addOrder(OrderEntity order) {
        OrderEntity newOrder;
        try {
            newOrder = orderRepository.save(order);
            return newOrder;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> findByAccount_Id(long id) {
        List<OrderEntity> list;
        try {
            list = orderRepository.findByAccount_IdOrderByIdDesc(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> findByOrderByIdDesc() {
        List<OrderEntity> list;
        try {
            list = orderRepository.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> findByDateOfBookingDesc() {
        List<OrderEntity> list;
        try {
            list = orderRepository.findAllByOrderByDateOfBookingDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> searchOrder(String name) {
        name = "%" + name + "%";
        return orderRepository.searchOrder(name, name, name, name);
    }

    @Override
    public OrderEntity findById(long id) {
        return orderRepository.findById(id);
    }

    @Override
    public Double sumMoneyOrder(String startDate, String endDate) {
        return orderRepository.sumMoneyOrder(startDate, endDate);
    }

    @Override
    public Double sumMoney() {
        return orderRepository.sumMoney();
    }

    @Override
    public List<OrderEntity> order_success() {
        List<OrderEntity> list;
        try {
            list = orderRepository.order_success();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> order_failed() {
        List<OrderEntity> list;
        try {
            list = orderRepository.order_failed();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> search_order_success(String startDate, String endDate) {
        List<OrderEntity> list;
        try {
            list = orderRepository.search_order_success(startDate, endDate);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<OrderEntity> search_order_failed(String startDate, String endDate) {
        List<OrderEntity> list;
        try {
            list = orderRepository.search_order_failed(startDate, endDate);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByYear() {
        try {
            return orderRepository.revenueByYear();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByQuarter() {
        try {
            return orderRepository.revenueByQuarter();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByMonth() {
        try {
            return orderRepository.revenueByMonth();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByCustomer() {
        try {
            return orderRepository.revenueByCustomer();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> revenueByWeek() {
        try {
            return orderRepository.revenueByWeek();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
