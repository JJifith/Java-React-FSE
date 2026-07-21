# Singleton Pattern

## Objective
Implement the Singleton Design Pattern in Java to ensure only one instance of the Logger class exists.

## Project Structure

```
SingletonPatternExample
│
├── src
│   ├── Logger.java
│   └── Main.java
```

## Classes

### Logger
- Private constructor
- Private static instance
- Public `getInstance()` method
- `log()` method for logging messages

### Main
Tests the Singleton implementation by obtaining two Logger references and verifying they point to the same object.

## Output


```
Logger instance created.
[LOG] Application Started
[LOG] Loading User Data

Logger1 HashCode: 149928006
Logger2 HashCode: 149928006

Only one Logger instance exists.

Process finished with exit code 0
```

## Design Pattern Used

Singleton Pattern