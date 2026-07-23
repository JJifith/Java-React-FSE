# Week 4 — Microservices (Spring Cloud)

Microservices hands-on: Eureka, account/loan services, greet-service, and API Gateway.

## Projects

| Service | Port | Eureka Name |
|---------|------|-------------|
| eureka-discovery-server | 8761 | (server) |
| account | 8080 | account-service |
| loan | 8081 | loan-service |
| greet-service | 8082 | greet-service |
| api-gateway | 9090 | api-gateway |

## Startup order

1. Eureka Discovery Server → http://localhost:8761
2. account, loan, greet-service
3. api-gateway

## Sample calls

```bash
curl http://localhost:8080/accounts/00987987973432
curl http://localhost:8081/loans/H00987987972342
curl http://localhost:8082/greet
curl http://localhost:9090/greet-service/greet
```

Stack: Spring Boot 3.2.5 + Spring Cloud 2023.0.1
