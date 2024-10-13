package com.git_bank.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.git_bank.demo.model.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> { 

}
