package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.Pet;

import java.util.List;

public interface PetDao {
    Pet selectById(int id);

    List<Pet> selectAll();

    List<Pet> selectByName(String name);

    List<Pet> selectByCategory(String category);

    List<Pet> selectByProjectName(String name);

    List<Pet> vagueSelectByName(String name);

    List<Pet> vagueSelectByProjectName(String name);

    void updateUser(Pet pet);

    void insertPet(Pet pet);

    void deletePet(Pet pet);
}
