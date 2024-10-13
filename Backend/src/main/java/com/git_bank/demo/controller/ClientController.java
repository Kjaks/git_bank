package com.git_bank.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.git_bank.demo.model.Client;
import com.git_bank.demo.service.ClientService;

@RestController
@RequestMapping("/api/clients")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @PostMapping
    public ResponseEntity<Client> createClient(@RequestBody Client client) {
        System.out.println("Datos recibidos: " + client);
        if (client.getClientName() == null || client.getClientName().isEmpty()) {
            return ResponseEntity.badRequest().body(null);
        }
        Client createdClient = clientService.createClient(client);
        return new ResponseEntity<>(createdClient, HttpStatus.CREATED);
    }
    
}
