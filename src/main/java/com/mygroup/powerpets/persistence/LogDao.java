package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.Log;

public interface LogDao {
    Log selectByUserId(int id);

    void insertLog(Log log);

    void deletePet(Log log);

    void updateLog(Log log);
}
