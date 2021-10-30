package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.Cart;

public interface CartDao {
     void insertCart(Cart cart);
     void deleteCart(Cart cart);
     void updateCart(Cart cart);
     Cart selectByuserID(int id);
}
