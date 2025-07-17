package com.cognizant.spring_rest_hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    public HelloController() {
        System.out.println("Inside HelloController constructor");
    }

    @GetMapping("/hello")
    public String sayHello() {
        System.out.println("Start of sayHello()");
        String message = "Hello World!!";
        System.out.println("End of sayHello()");
        return message;
    }
}
