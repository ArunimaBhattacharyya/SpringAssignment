package com.example.SpringBoot.repository;

import com.example.SpringBoot.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends JpaRepository<UserEntity, Integer> {

    UserEntity findByUsername(String username);
}
