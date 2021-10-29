package com.mygroup.powerpets.domain;

public class Cart {
    int userID;
    String petsID;
    int amount;

    public Cart(int userID, String petsID, int amount) {
        this.userID = userID;
        this.petsID = petsID;
        this.amount = amount;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPetsID() {
        return petsID;
    }

    public void setPetsID(String petsID) {
        this.petsID = petsID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
