package com.mygroup.powerpets.domain;

import java.math.BigDecimal;

public class OngoingOrder {
    private int orderID;
    private int userID;
    private int petID;
    private int deliveryID;
    private int status;
    private BigDecimal cost;

    public OngoingOrder(int orderID, int userID, int petID, int deliveryID, int status, BigDecimal cost) {
        this.orderID = orderID;
        this.userID = userID;
        this.petID = petID;
        this.deliveryID = deliveryID;
        this.status = status;
        this.cost = cost;
    }

    public OngoingOrder(int userID, int petID, BigDecimal cost) {
        this.userID = userID;
        this.petID = petID;
        this.deliveryID = (int) (Math.random() * 900000) + 100000;
        this.status = 1;
        this.cost = cost;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPetID() {
        return petID;
    }

    public void setPetID(int petID) {
        this.petID = petID;
    }

    public int getDeliveryID() {
        return deliveryID;
    }

    public void setDeliveryID(int deliveryID) {
        this.deliveryID = deliveryID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "OngoingOrder{" +
                "orderID=" + orderID +
                ", userID=" + userID +
                ", petID=" + petID +
                ", deliveryID=" + deliveryID +
                ", status=" + status +
                ", cost=" + cost +
                '}';
    }
}
