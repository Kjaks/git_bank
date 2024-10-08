package com.git_bank.demo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/clients") // Cambiado a "/api/clients"
public class ClientController { // Cambiado a ClientController

    @Autowired
    private ClientService clientService; // Cambiado a ClientService

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
