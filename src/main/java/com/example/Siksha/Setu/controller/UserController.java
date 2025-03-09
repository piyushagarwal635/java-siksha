package com.example.Siksha.Setu.controller;

import com.example.Siksha.Setu.User;
import com.example.Siksha.Setu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    // ✅ New Endpoint to Check if Disability ID Exists
    @GetMapping("/check/{disabilityId}")
    public ResponseEntity<Boolean> checkUser(@PathVariable String disabilityId) {
        boolean exists = userRepository.existsByDisabilityId(disabilityId);
        return ResponseEntity.ok(exists);
    }

    // ✅ Existing User Creation API
    @PostMapping
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }
}
