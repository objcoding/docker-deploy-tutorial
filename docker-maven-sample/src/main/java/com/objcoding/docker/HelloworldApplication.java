package com.objcoding.docker;

import com.objcoding.starters.helloworld.HelloworldService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

    private final static Logger logger = LoggerFactory.getLogger(HelloworldApplication.class);

    @Autowired
    private HelloworldService helloworldService;

    @RequestMapping("/")
    public String sayHello() {
        logger.info("============ " + helloworldService.sayHello() + " ==============");
        return helloworldService.sayHello();
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloworldApplication.class, args);

    }
}
