package com.mygroup.powerpets.service;

import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;

public class MyStatisticsService {
    public static int getUserAmount() {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        return userDaoImpl.selectAll().toArray().length;
    }

    public static int getItemsAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectAll().toArray().length;
    }

    public static int getDogsAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectByCategory("DOGS").size();
    }

    public static int getCatsAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectByCategory("CATS").toArray().length;
    }

    public static int getBirdsAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectByCategory("BIRDS").toArray().length;
    }

    public static int getPigsAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectByCategory("PIG").toArray().length;
    }

    public static int getOthersAmount() {
        PetDaoImpl petDaoImpl = new PetDaoImpl();
        return petDaoImpl.selectByCategory("OTHERS").toArray().length;
    }
}
