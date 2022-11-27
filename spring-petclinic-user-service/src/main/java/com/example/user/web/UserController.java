package com.example.user.web;

import com.example.user.model.User;

import com.example.user.model.UserRepository;
import io.micrometer.core.annotation.Timed;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;
import javax.validation.constraints.Min;

@RequestMapping("/user")
@RestController
@Timed("petclinic.user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserRepository userRepository;
    /**
     * Read single user
     */
    @GetMapping(value = "/{username}")
    public Optional<User> findUser(@PathVariable("username") String username) {
        return Optional.ofNullable(userRepository.findUserByName(username));
    }

}
