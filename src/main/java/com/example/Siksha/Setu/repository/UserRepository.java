package com.example.Siksha.Setu.repository;

import com.example.Siksha.Setu.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByDisabilityId(String disabilityId);
}

