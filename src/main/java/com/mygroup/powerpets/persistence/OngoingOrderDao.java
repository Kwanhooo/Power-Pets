package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.OngoingOrder;

import java.util.List;

public interface OngoingOrderDao {
    void insertOngoingOrder(OngoingOrder order);
    void deleteOngoingOrder(OngoingOrder order);
    void updateOngoingOrder(OngoingOrder order);
    List<OngoingOrder> selectByuserID(int id);
    OngoingOrder selectByorderID(int id);
}
