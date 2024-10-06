package com.git_bank.demo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService { // Cambiado a ClientService

    @Autowired
    private ClientRepository clientRepository; // Cambiado a ClientRepository

    public Client createClient(Client client) { // Cambiado a createClient
        System.out.println("Client Name: " + client.getClientName()); // Cambiado a getClientName
        return clientRepository.save(client); // Cambiado a clientRepository
    }
}
