package com.mygroup.powerpets.domain;

import java.math.BigDecimal;

public class Pet {

    private int petID;
    private String petName;
    private BigDecimal price;
    private int age;
    private String sex;

    /*
     *  1 is not sold
     *  0 is sold
     */
    private int status;

    private String category;
    private String product;

    public Pet(int petID, String petName, BigDecimal price, int age, String sex, int status, String catagory, String product) {
        this.petID = petID;
        this.petName = petName;
        this.price = price;
        this.age = age;
        this.sex = sex;
        this.status = status;
        this.category = catagory;
        this.product = product;
    }

    public int getPetID() {
        return petID;
    }

    public void setPetID(int petId) {
        this.petID = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }


}
