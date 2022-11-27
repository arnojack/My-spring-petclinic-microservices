package org.springframework.samples.petclinic.api.application;

import lombok.RequiredArgsConstructor;
import org.springframework.samples.petclinic.api.dto.User;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Component
@RequiredArgsConstructor
public class UserServiceClient {

    private final WebClient.Builder webClientBuilder;

    public Mono<User> get_login_res(String username) {
        return webClientBuilder.build().get()
            .uri("http://user-service/user/{username}", username)
            .retrieve()
            .bodyToMono(User.class);
    }
}
