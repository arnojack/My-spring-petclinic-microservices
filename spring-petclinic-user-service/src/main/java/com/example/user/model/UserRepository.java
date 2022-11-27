package com.example.user.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Integer> {
    @Query(nativeQuery = true, value = "select * from user where username=?")
    User findUserByName(String username);
}
