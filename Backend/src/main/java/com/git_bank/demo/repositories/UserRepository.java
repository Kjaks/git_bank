package com.git_bank.demo.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.git_bank.demo.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> { 
    Optional<User> findByEmail(String email);
}
