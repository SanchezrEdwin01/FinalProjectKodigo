package com.example.orderswift.service.orderdetail;

import com.example.orderswift.exception.ResourceNotFoundException;
import com.example.orderswift.model.OrderDetail;
import com.example.orderswift.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{
    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Override
    public String saveOrderDetail(OrderDetail orderDetail) {
        orderDetailRepository.save(orderDetail);
        return "New order detail has been added";
    }

    @Override
    public List<OrderDetail> getAllOrdersDetail() {return orderDetailRepository.findAll();}

    @Override
    public OrderDetail getOrderDetailByIdOrder(Integer id_order) {
        return orderDetailRepository.findById(id_order)
                .orElseThrow(()-> new ResourceNotFoundException("Order detail not found for the id " + id_order));
    }

    @Override
    public OrderDetail updateOrderDetail(OrderDetail orderDetail, Integer id_orderDetail) {
        return orderDetailRepository.findById(id_orderDetail).map(orderDetail1 -> {
            orderDetail.setQuantity(orderDetail.getQuantity());
            orderDetail.setUnitPrice(orderDetail.getUnitPrice());
            orderDetail.setOrder(orderDetail.getOrder());
            orderDetail.setProduct(orderDetail.getProduct());
            return orderDetailRepository.save(orderDetail);
        }).orElseThrow(()->new ResourceNotFoundException("Order detail not found for the id " + id_orderDetail));
    }

    @Override
    public String deleteOrderDetail(Integer id_orderDetail) {
        orderDetailRepository.deleteById(id_orderDetail);
        return "The order detail with the ID num " + id_orderDetail + " has been deleted success";
    }
}
