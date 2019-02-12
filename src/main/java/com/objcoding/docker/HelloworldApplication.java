package com.objcoding.docker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by chenghui.zhang on 2018/2/5.
 */
@RestController
@SpringBootApplication
public class HelloworldApplication {

    @RequestMapping("/")
    public String sayHello() {
        return "hello docker";
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloworldApplication.class, args);

    }
}
