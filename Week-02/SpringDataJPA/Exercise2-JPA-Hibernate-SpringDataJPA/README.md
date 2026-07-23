# Exercise 2 - Difference between JPA, Hibernate and Spring Data JPA

## Aim

To understand the difference between JPA, Hibernate and Spring Data JPA.

## JPA

- Java Persistence API (Specification)
- Defines standard interfaces for object-relational mapping.
- Does not provide implementation.

## Hibernate

- ORM framework.
- Implements the JPA specification.
- Handles database operations using Session API.

## Spring Data JPA

- Built on top of JPA.
- Reduces boilerplate code.
- Uses repositories such as JpaRepository.
- Simplifies CRUD operations.
- Provides transaction management.

## Comparison

| JPA | Hibernate | Spring Data JPA |
|-----|-----------|-----------------|
| Specification | Implementation | Framework built on JPA |
| No implementation | Implements JPA | Uses JPA implementations |
| Defines APIs | Uses Session API | Uses Repository API |
| Vendor independent | ORM framework | Simplifies persistence |

## Files Included

- HibernateExample.java
- EmployeeRepository.java
- EmployeeService.java