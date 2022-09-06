package com.example.vault;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;

@SpringBootApplication
public class VaultApplication implements CommandLineRunner {

  @Value("${password}")
  private String password;

  public VaultApplication() {}

  public static void main(String[] args) {
    SpringApplication.run(VaultApplication.class, args);
  }

  @Override
  public void run(String... args) {

    Logger logger = LoggerFactory.getLogger(VaultApplication.class);

    logger.info("----------------------------------------");
    logger.info("Configuration properties");
    logger.info("   password is {}", password);
    logger.info("----------------------------------------");
  }
}