package com.git_bank.demo.dtos;

public class RegisterUserDto {
    private String email;
    private String password;
    private String username; // Cambié fullName a username

    public RegisterUserDto() {}

    public RegisterUserDto(String email, String password, String username) {
        this.email = email;
        this.password = password;
        this.username = username; // Actualizado aquí
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return this.username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) { // Cambié setFullName a setUsername
        this.username = username;
    }
}
