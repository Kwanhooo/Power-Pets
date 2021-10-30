package com.mygroup.powerpets.domain;

import java.math.BigDecimal;

public class User {
    private int id;
    private String username;
    private String password;
    private String address;
    private BigDecimal balance;
    private String sex;
    private int age;
    private String email;


    public User(int id, String username, String password, String address, BigDecimal balance, String sex, int age, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.address = address;
        this.balance = balance;
        this.sex = sex;
        this.age = age;
        this.email = email;
    }

    public User(String username, String password, String address, BigDecimal balance, String sex, int age, String email) {
        this.username = username;
        this.password = password;
        this.address = address;
        this.balance = balance;
        this.sex = sex;
        this.age = age;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}