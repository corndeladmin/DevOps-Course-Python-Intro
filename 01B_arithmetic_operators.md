---
title: "Chapter 1B: Arithmetic operators"
description: Bonus chapter on more arithmetic operators
---

# Chapter 1B: Arithmetic Operators

## Chapter objectives

In the previous chapter we tried out same basic calculations in the Python REPL.
We'll now take a deeper look at the arithmetic operators available in Python.

In this chapter you will:
- Learn which arithmetic operators Python has,
- Learn what each operator does,
- Learn about precedence,
- Practise using each arithmetic operator.

## What's an arithmetic operator?

Arithmetic operators are used to perform mathematical operations (e.g. addition) on values.
In the previous chapter, we tried out the operators for addition (`+`) and subtraction (`-`).

Python actually has a whole range of arithmetic operators that can be used in calculations:

| Operator  | Name              | Usage     | Result    |
|-----------|-------------------|-----------|-----------|
| +         | Addition          | `10 + 3`  | 13        |
| -         | Subtraction       | `10 - 3`  | 7         |
| *         | Multiplication    | `10 * 3`  | 30        |
| /         | Division          | `10 / 3`  | 3.33...   |
| **        | Exponentiation    | `10 ** 3` | 1000      |
| //        | Floor division    | `10 // 3` | 3         |
| %         | Modulus           | `10 % 3`  | 1         |

## How do they work?

### The familiar ones

You will have come across addition, subtraction, multiplication, and division before, and they work as expected in Python.

For example, if we tried them out in the REPL, it would look like this:

```
>>> 7 + 2
9
>>> 7 - 2
5
>>> 7 * 2
14
>>> 7 / 2
3.5
```

### Exponentiation

The exponentiation operator (`**`) raises the left-hand number to the power of the right-hand number.

> `2 ** 3` is the Python equivalent of 2<sup>3</sup>.
> This would multiply 2 by itself 3 times (`2 * 2 * 2`), evaluating to 8.

For example, if we have a square with a side length of 12, we can calculate its area by running `12 ** 2`:

```
>>> 12 ** 2
144
```

If we instead have a cube with a side length of 7, we can calculate its volume by running `7 ** 3`:

```
>>> 7 ** 3
343
```

### Floor division

In regular division (`/`), we can sometimes get a decimal number as our result:

```
>>> 9 / 2
4.5
>>> 28 / 16
1.75
>>> 27 / 10
2.7
```

In floor division (`//`), only the integer part of the result is returned:

```
>>> 9 // 2
4
>>> 28 // 16
1
>>> 27 // 10
2
```

Floor division can be used to calculate how many times a number "goes into" another when dividing.
Let's consider `23 / 5`: in this case, 5 goes into 23 4 times (for a total of 20), with 3 left over.

If we try that out in the REPL:

```
>>> 23 // 5
4
```

> Floor division is also commonly known as _integer division_.

### Modulus

The modulus operator (`%`) calculates the remainder in a division.
For example, `16 % 5` calculates the remainder when dividing 16 by 5.

In this case, 5 can go into 16 3 times (for a total of 15), with 1 left over:

```
>>> 16 // 5
3
>>> 16 % 5
1
>>> 5 * 3 + 1
16
```

How about `23 % 6`? 6 goes into 23 3 times (for a total of 18), with a remainder of 5:

```
>>> 23 // 6
3
>>> 23 % 6
5
>>> 6 * 3 + 5
23
```

The modulo of 0 is 0:

```
>>> 0 % 7
0
>>> 7 % 7
0
>>> 14 % 7
0
```

As with division, it isn't possible to use 0 as a divisor:

```
>>> 2 / 0
ZeroDivisionError: division by zero
>>> 2 // 0
ZeroDivisionError: integer division or modulo by zero
>>> 2 % 0
ZeroDivisionError: integer division or modulo by zero
```

> The number that is being divided by is called the _divisor_.
> E.g. in `2 / 3`, 3 is the divisor.

### Modulus and clocks

The modulus operator (`%`) can be compared to measuring time on a clock.

When using a 12 hour clock, the time is measured modulo 12; when using a 24 hour clock, the time is measured module 24.

For example, if it's 11:00 on a 12 hour clock, and we wait 3 hours, the time swings back around to 2:00.

```
>>> 11 + 3
14
>>> 14 % 12
2
```

If we then wait 12 hours, we end up back at 2:00.

```
>>> 2 + 12
14
>>> 14 % 12
2
```

### Floor division, modulus, and pineapples

Floor division and modulus also pop up when shopping!

Imagine we have £14, a pineapple costs £3, and we want to buy as many pineapples as possible.

We can use floor division (`//`) to calculate how many pineapples we can afford:

```
>>> 14 // 3
4
```

We can afford 4 pineapples!
But how much money will we have left?
The modulus operator (`%`) can tell us that:

```
>>> 14 % 3
2
```

Putting it all together, we can afford to buy 4 pineapples, with £2 left over.

## Precedence

What if we want to use multiple operators in the same expression?
How does Python choose which order to evaluate them?
As in regular maths, each operator in Python has a precedence.

This table lists the operators that we've seen so far from highest precedence to lowest.
Operators on the same row have the same precedence.

| Operator      | Name                                              |
|---------------|---------------------------------------------------|
| **            | Exponentiation                                    |
| *, /, //, %   | Multiplication, division, floor division, modulus |
| +, -          | Addition, subtraction                             |

Operators are evaluated in order of precedence, with the highest precedence operators evaluated first.
When there are multiple arithmetic operators with the same precedence, they are usually evaluated from left to right.
The only exception is the exponentiation operator (`**`), which is evaluated from right to left.

```
>>> 2 + 3 * 4
14
>>> 10 - 2 - 1
7
>>> 1 + 3 ** 3 * 2
55
>>> 10 % 3 * 5 // 4
1
>>> 2 ** 3 ** 2
512
```

### Brackets

Brackets (a.k.a parentheses) take higher precedence than any of the arithmetic operators.
They can be used to change the order of operations in an expression:

```
>>> 1 + 2 * 3
7
>>> (1 + 2) * 3
9
>>> 10 - 5 - 3
2
>>> 10 - (5 - 3)
8
```

It isn't always immediately clear what order will be used when evaluating a complex expression, so brackets are often used for clarification:

```
>>> 4 ** 3 ** 2
262144
>>> 4 ** (3 ** 2)
262144
>>> 4 * 8 % 3
2
>>> (4 * 8) % 3
2
```

## Other resources

If you'd like to read some alternate explanations, or see some more examples, then you might find these resources helpful:

- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/2e/)
  - [Chapter 1](https://automatetheboringstuff.com/2e/chapter1/) covers expressions, arithmetic operators, and precedence.
- [Programiz](https://www.programiz.com/)
  - This site has a tutorial on [operator precedence](https://www.programiz.com/python-programming/precedence-associativity).

## Practice exercises

We've run through the general concepts, and now we'll get some hands-on experience.

It can be tempting to jump right into running each exercise in the REPL, but it's best to try and predict the answers first.
That way, you'll have a clearer idea about which concepts you find more or less intuitive.

> You can check your answers for each exercise at the end of this chapter.
>
> If you find an expression confusing, you might find it helpful to split it up into simpler expressions.
> Then you can evaluate the simpler expressions, before substituting them back in to the original expression.

### Exercise 1.11

Use the REPL to perform these calculations:

1. `72 + 365`
2. `614 + 819`
3. `84 - 3`
4. `12 - 134`
5. `2 * 6`
6. `61 * 31`
7. `8 / 4`
8. `103 / 5`

### Exercise 1.12

Use the REPL to perform these calculations:

1. `3 ** 2`
2. `5 ** 3`
3. `3 ** 2 ** 3`
4. `3 ** (2 ** 3)`
5. `(3 ** 2) ** 3`

> Remember that the exponentiation operator is the only arithmetic operator that is evaluated from right to left!

### Exercise 1.13

Use the REPL to perform these calculations:

1. `10 / 3`
2. `10 // 3`
3. `8 / 2`
4. `8 // 2`
5. `121 / 4`
6. `121 // 4`
7. `121 / 4 / 2`
8. `121 // 4 // 2`

> In floor division, only the integer part of the result is returned.

### Exercise 1.14

Use the REPL to perform these calculations:

1. `0 % 5`
2. `6 % 5`
3. `8 % 5`
4. `6 % 1`
5. `11 % 3`
6. `20 % 11`
7. `20 % 11 % 5`
8. `(20 % 11) % 5`
9. `20 % (11 % 5)`

> Remember that the modulo of 0 is 0!

### Exercise 1.15

Use the REPL to perform these calculations:

1. `2 * 3 + 1`
2. `1 + 2 * 3`
3. `(2 * 3) + 1`
4. `2 * (3 + 1)`
5. `3 ** 3 % 5 ** 2`
6. `(3 ** 3) % (5 ** 2)`
7. `3 ** (3 % 5) ** 2`
8. `(3 ** 3 % 5) ** 2`
9. `3 ** (3 % 5 ** 2)`

> Remember that the exponentiation operator is the only arithmetic operator that is evaluated from right to left!

## Troubleshooting exercises

There's a few issues that people can run into when performing calculations in Python.
We've listed some of the most common ones here.

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 1.16

Why is an error being printed?

```
> 1 + 2) * (3 + 4)
SyntaxError: unmatched ')'
```

### Exercise 1.17

Why is an error being printed?

```
>>> 1 + 2 3
SyntaxError: invalid syntax
```

### Exercise 1.18

Why is an error being printed?

```
>>> 1 + 2 *
SyntaxError: invalid syntax
```

### Exercise 1.19

Why is an error being printed?

```
>>> 5 % (3 ** 2 - 9)
ZeroDivisionError: integer division or modulo by zero
```

## Summary

We've reached the end of the arithmetic operators. At this point you should know:
- Which arithmetic operators Python has,
- What each arithmetic operator does,
- Each operator's precedence,
- How to use each operator in calculations.

Next up is [Chapter 2: Variables](./02_variables.md)

## Answers

### Exercise 1.11

1. 437
2. 1433
3. 81
4. -122
5. 12
6. 1891
7. 2.0
8. 20.6

### Exercise 1.12

1. 9
2. 125
3. 6561
4. 6561
5. 729

### Exercise 1.13

1. 3.33...
2. 3
3. 4.0
4. 4
5. 30.25
6. 30
7. 15.125
8. 15

### Exercise 1.14

1. 0
2. 1
3. 3
4. 0
5. 2
6. 9
7. 4
8. 4
9. 0

### Exercise 1.15

1. 7
2. 7
3. 7
4. 8
5. 2
6. 2
7. 19683
8. 4
9. 27

### Exercise 1.16

Expressions must have an equal number of opening and closing brackets.
This expression is missing an opening bracket, so it's invalid.

### Exercise 1.17

The operator between the 2 and 3 is missing.

### Exercise 1.18

The `*` arithmetic operator requires two operands, but it only has one operand here.

### Exercise 1.19

`3 ** 2 - 9` evaluates to 0, and it isn't possible to use 0 as a divisor.
