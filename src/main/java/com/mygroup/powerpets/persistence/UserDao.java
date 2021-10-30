package com.mygroup.powerpets.persistence;
import com.mygroup.powerpets.domain.User;

import java.util.List;

/**
 * 用户的CRUD
 * @author Kwanho
 */
public interface UserDao {
    User selectById(int id);
    List<User> selectByName(String username);
    User selectByEmail(String email);
    void updateUser(User user);
    void deleteUser(User user);
    void insertUser(User user);
}