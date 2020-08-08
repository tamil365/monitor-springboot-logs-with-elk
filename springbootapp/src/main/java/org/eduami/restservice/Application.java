package org.eduami.restservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    private static Logger logger = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) throws InterruptedException {
        SpringApplication.run(Application.class, args);
        for (int i = 0; i < 5000; i++) {
            logger.info("App log Current tile is "+java.time.LocalDate.now());
            Thread.sleep(1000);//Sleep for one second
        }
    }

}
