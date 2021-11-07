package com.mygroup.powerpets.service;

import com.mygroup.powerpets.domain.Log;
import com.mygroup.powerpets.persistence.impl.LogDaoImpl;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogService {
    public static void addBrowsedPets(int userID, String petProject) {
        LogDaoImpl logDaoimpl = new LogDaoImpl();
        Log oldLog = logDaoimpl.selectByUserId(userID);

        if (oldLog == null) {
            logDaoimpl.insertLog(new Log(userID, "start#", "start#", "start#"));
        }
        oldLog = logDaoimpl.selectByUserId(userID);
        String oldBrowsedPetID = oldLog.getBrowsedPetID();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());

        String newBrowsedPetID = oldBrowsedPetID + formatter.format(date) + "@" + petProject + "#";

        Log logToAppend = new Log(userID, newBrowsedPetID, oldLog.getCartAction(), oldLog.getOrderGenerated());
        logDaoimpl.updateLog(logToAppend);
    }

    public static void addCartAction(int userID, String action, int petID) {
        LogDaoImpl logDaoimpl = new LogDaoImpl();
        Log oldLog = logDaoimpl.selectByUserId(userID);

        if (oldLog == null) {
            logDaoimpl.insertLog(new Log(userID, "start#", "start#", "start#"));
        }

        oldLog = logDaoimpl.selectByUserId(userID);
        String oldCartAction = oldLog.getCartAction();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());

        String newCartAction = oldCartAction + formatter.format(date) + "@" + action + "-" + petID + "#";
        Log logToAppend = new Log(userID, oldLog.getBrowsedPetID(), newCartAction, oldLog.getOrderGenerated());
        logDaoimpl.updateLog(logToAppend);
    }

    public static void addOrderGenerated(int userID, int orderID) {
        LogDaoImpl logDaoimpl = new LogDaoImpl();
        Log oldLog = logDaoimpl.selectByUserId(userID);

        if (oldLog == null) {
            logDaoimpl.insertLog(new Log(userID, "start#", "start#", "start#"));
        }
        oldLog = logDaoimpl.selectByUserId(userID);

        String oldOrderGenerated = oldLog.getOrderGenerated();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());

        String newOrderGenerated = oldOrderGenerated + formatter.format(date) + "@" + orderID + "#";
        Log logToAppend = new Log(userID, oldLog.getBrowsedPetID(), oldLog.getCartAction(), newOrderGenerated);
        logDaoimpl.updateLog(logToAppend);
    }

    public static String[] buildLogsList(int userID) {
        LogDaoImpl logDaoimpl = new LogDaoImpl();
        Log userLog = logDaoimpl.selectByUserId(userID);
        return (userLog.getBrowsedPetID() + userLog.getCartAction() + userLog.getOrderGenerated()).split("#");
    }
}
