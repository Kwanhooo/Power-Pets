package com.mygroup.powerpets.domain;

import java.math.BigDecimal;

public class CompletedOrder {
    private int orderID;
    private int userID;
    private int petID;
    private String comments;
    private BigDecimal cost;

    public CompletedOrder(int orderID, int userID, int petID, String comments, BigDecimal cost) {
        this.orderID = orderID;
        this.userID = userID;
        this.petID = petID;
        this.comments = comments;
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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }
}
