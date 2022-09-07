# spring-cloud-vault-docker

The project aims to show a quick sample of a Spring Application using data from different Vault Paths and
making use of Vault APP Role authentication method.

### Getting Started

#### Starting Vault:
```
docker-compose up -d vault
```

#### Script to set up basic Vault Config with Secrets and APP Role
```
docker exec -it vault /usr/local/bin/vault-init.sh
```

The Role ID and Secret ID are displayed at the end of the script output and should be added in ```application-dev.properties``` and ```application-prod.properties```

#### Running the Application with dev profile
```./gradlew bootRun --args='--spring.profiles.active=dev'```

#### Running the Application with prod profile
```./gradlew bootRun --args='--spring.profiles.active=prod'```

#### Vault address
The Vault can be accessed locally at ```http://localhost:8200``` with the token ```00000000-0000-0000-0000-000000000000```
