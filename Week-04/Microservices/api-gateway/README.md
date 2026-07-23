# API Gateway

- Port: `9090`
- Routes to `greet-service` via Eureka (`lb://greet-service`)
- Global `LogFilter` logs each request path

```bash
mvn spring-boot:run
curl http://localhost:9090/greet-service/greet
```
