package com.mygroup.powerpets.domain;

public class Log {
    private int userID;
    private String browsedPetID;
    private String cartAction;
    private String orderGenerated;

    public Log(int userID, String browsedPetID, String cartAction, String orderGenerated) {
        this.userID = userID;
        this.browsedPetID = browsedPetID;
        this.cartAction = cartAction;
        this.orderGenerated = orderGenerated;
    }


    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getBrowsedPetID() {
        return browsedPetID;
    }

    public void setBrowsedPetID(String browsedPetID) {
        this.browsedPetID = browsedPetID;
    }

    public String getCartAction() {
        return cartAction;
    }

    public void setCartAction(String cartAction) {
        this.cartAction = cartAction;
    }

    public String getOrderGenerated() {
        return orderGenerated;
    }

    public void setOrderGenerated(String orderGenerated) {
        this.orderGenerated = orderGenerated;
    }
}
