package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.CompletedOrder;

import java.util.List;

public interface CompletedOrderDao {
    void insertCompletedOrder(CompletedOrder order);

    void deleteCompletedOrder(CompletedOrder order);

    void updateOngoingOrder(CompletedOrder order);

    List<CompletedOrder> selectByuserID(int id);

    CompletedOrder selectByorderID(int id);
}
