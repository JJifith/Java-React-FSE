# Financial Forecasting

## Aim

To implement a recursive algorithm for predicting future financial values.

## Concept of Recursion

Recursion is a programming technique where a method calls itself to solve a problem. It simplifies problems that can be divided into smaller subproblems.

## Files

- FinancialForecast.java
- Main.java

## Algorithm

The future value is calculated recursively using the formula:

Future Value = Current Value × (1 + Growth Rate)

The recursive function repeatedly applies the growth rate until the required number of years is reached.

## Time Complexity

- Time Complexity: **O(n)**
- Space Complexity: **O(n)** (due to recursive call stack)

## Optimization

The recursive solution can be optimized by using:
- Iteration (to avoid recursion overhead)
- Memoization (for problems with overlapping subproblems)

## Output

```
Current Value : 10000.00
Growth Rate   : 10.00%
Years         : 5
Future Value  : 16105.10
```