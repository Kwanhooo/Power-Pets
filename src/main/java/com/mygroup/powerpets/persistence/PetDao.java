package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.Pet;

import java.util.List;

public interface PetDao {
    Pet selectById(int id);

    List<Pet> selectByName(String name);

    void updateUser(Pet pet);

    void insertPet(Pet pet);

    void deletePet(Pet pet);
}
