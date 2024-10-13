package com.git_bank.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git_bank.demo.model.Client;
import com.git_bank.demo.repository.ClientRepository;

@Service
public class ClientService {

    @Autowired
    private ClientRepository clientRepository;

    public Client createClient(Client client) {
        System.out.println("Client Name: " + client.getClientName());
        return clientRepository.save(client);
    }
}
