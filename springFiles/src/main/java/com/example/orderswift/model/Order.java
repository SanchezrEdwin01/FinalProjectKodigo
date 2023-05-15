package com.example.orderswift.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;


@Entity(name = "Order") @Table(name = "orders") @Data @AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "order_date")
    private LocalDateTime orderDate;

    @Column(name = "order_status")
    @NotBlank(message = "Order status must not be null or blank")
    private String orderStatus;

    @Column(name = "total_amount")
    @Positive(message = "Total amount must be greater than zero")
    private Double totalAmount;

    public Order(int i, String s, String s1, double v, String aNew) {
    }

    public Order() {

    }

    public Order(int i, Date date, String string, double v) {
    }

    public Integer getOrderId() {
        return orderId;
    }
}