package com.mygroup.powerpets.persistence;
import com.mygroup.powerpets.domain.Pet;

import java.util.List;

public interface PetDao {
    Pet selectById(int id);
    List<Pet> selectByName(String name);
    void UpdateUser(Pet pet);
    void InsertPet(Pet pet);
    void DeletePet(Pet pet);
}
