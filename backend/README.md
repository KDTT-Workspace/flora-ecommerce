# Flora

A Spring Boot project with Java and Maven.

## Project Structure

```
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/flora/
│   │   │       ├── controller/
│   │   │       ├── service/
│   │   │       ├── repository/
│   │   │       ├── model/
│   │   │       ├── config/
│   │   │       ├── FloraApplication.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   ├── test/
│   │   ├── java/
│   │   │   └── com/example/flora/
│   │   │       ├── controller/
│   │   │       ├── service/
├── pom.xml
```

## API Endpoints

- GET /api/examples - Retrieve all examples
- GET /api/examples/{id} - Retrieve an example by ID
- POST /api/examples - Create a new example
