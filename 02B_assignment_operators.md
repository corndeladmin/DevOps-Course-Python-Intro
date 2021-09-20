---
title: "Chapter 2B: Assignment Operators"
description: Bonus chapter on augmented assignment operators and unary operators
---

# Chapter 2B: Assignment Operators

## Chapter objectives

We've learned how to define a variable with the assignment operator (`=`), and now we'll look at a few closely related operators - the _augmented assignment operators_.
We'll also learn about the _unary arithmetic operators_.

In this chapter you will:
- Learn what the augmented assignment operators and unary arithmetic operators are, and how they're used,
- Practise using the augmented assignment operators and unary arithmetic operators.

## Augmented assignment operators

### What's an augmented assignment operator?

In the previous chapter we used the basic assignment operator (`=`) to define and overwrite variables.
We also saw how variables can be used in calculations:

```
>>> my_first_number = 2
>>> my_second_number = my_first_number + 5
>>> my_second_number
7
>>> my_second_number = 2
>>> my_second_number
2
```

When using the assignment operator, it's actually valid for the right hand side of the assignment to reference the variable that's being assigned to!
For example:

```
>>> my_number = 2
>>> my_number = my_number + 1
>>> my_number
3
```

`my_number = my_number + 1` means that `my_number` is assigned the current value of `my_number` (i.e. 2) plus 1.

Incrementing a variable like this is pretty common, so Python includes an operator that provides a shortcut:

```
>>> my_number = 5
>>> my_number += 6
>>> my_number
11
```

`+=` is known as an _augmented assignment operator_, because it's actually a combination of two operations:
1. Adding a number to the variable's current value (`+`),
2. Assigning the updated value back to the variable (`=`).

> Augmented assignment operators are sometimes called _compound assignment operators_.

You can also use `+=` to increment a variable by the value of a different variable:

```
>>> my_first_number = 7
>>> my_second_number = 8
>>> my_first_number += my_second_number
>>> my_first_number
15
```

### What augmented assignment operators are available?

`+=` is perhaps the most commonly used augmented assignment operator, but there's actually quite a few others.
In fact, each of the arithmetic operators we covered in chapter 2 has a corresponding augmented assignment operator:

| Operator  | Usage               | Alternative                       |
|-----------|---------------------|-----------------------------------|
| +=        | my_number += 3      | my_number = my_number + 3         |
| -=        | my_number -= 3      | my_number = my_number - 3         |
| *=        | my_number *= 3      | my_number = my_number * 3         |
| /=        | my_number /= 3      | my_number = my_number / 3         |
| %=        | my_number %= 3      | my_number = my_number % 3         |
| //=       | my_number //= 3     | my_number = my_number // 3        |
| **=       | my_number **= 3     | my_number = my_number ** 3        |

They each work in a similar way to `+=`.
For example, `my_number **= 3` means that `my_number` is assigned the current value of `my_number` raised to the power of 3.

```
>>> my_number = 7
>>> my_number
7
>>> my_number += 4
>>> my_number
11
>>> my_number -= 3
>>> my_number
8
>>> my_number *= 4
>>> my_number
32
>>> my_number /= 2
>>> my_number
16.0
>>> my_number %= 9
>>> my_number
7.0
>>> my_number //= 2
>>> my_number
3.0
>>> my_number **= 3
>>> my_number
27.0
```

### Revisiting storage boxes

In the previous chapter we thought of variables as storage boxes, and each variable's value as the item in its box.
We can expand this analogy to describe how augmented assignment operators work:

| Variables                           | Storage boxes                                                                 |
|-------------------------------------|-------------------------------------------------------------------------------|
| my_variable = my_variable + 1       | Take the item out its box, update the item, and put the item back in its box  |
| my_variable += 1                    | Update the item while it's in its box                                         |

> The effect is exactly the same either way. The `+=` is just a prettier shorthand for the same instruction. 

## Unary arithmetic operators

### What are the unary arithmetic operators? 

Throughout the previous chapters we've seen how `+` and `-` can be used as arithmetic operators for addition and subtraction:

```
>>> 7 + 2
9
>>> 7 - 2
5
```

When using `+` and `-` to add or subtract, the operator is surround by two operands (e.g. `1 + 2`).
However, `+` and `-` can also be used as a prefix for a single operand (e.g. `+1` or `-1`).
When `+` and `-` are used like this, they're known as the _unary arithmetic operators_:

| Name                  | Usage       |
|-----------------------|-------------|
| Addition operator     | 3 + 4       |
| Subtraction operator  | 7 - 13      |
| Unary plus operator   | +2          |
| Unary minus operator  | -2          |

As you might expect, putting `-` before an expression changes its sign:

```
>>> my_number = -3
>>> my_number
-3
>>> -my_number
3
>>> -(2 + 3)
-5
```

Putting `+` before an expression doesn't change its sign. It is almost always true that the unary `+` operator has no impact, i.e. `x` is equal to `+x`. There are certain niche scenarios with other data types where this is not strictly true, but it mainly exists for symmetry: you may sometimes find it helps readability to treat positive and negative numbers the same.

```
>>> my_first_number = +1
>>> my_second_number = -1
>>> my_first_number
1
>>> my_second_number
-1
```

### What's the precedence of the unary arithmetic operators?

This table lists the arithmetic operators that we've seen so far from highest precedence to lowest.
Operators on the same row have the same precedence.

| Operator                    | Name                                              |
|-----------------------------|---------------------------------------------------|
| **                          | Exponentiation                                    |
| +my_number, -my_number      | Unary plus, unary minus                           |
| *, /, //, %                 | Multiplication, division, floor division, modulus |
| +, -                        | Addition, subtraction                             |

The only arithmetic operator with a higher precedence than the unary arithmetic operators is the exponentiation operator (`**`). This can lead to surprising results:

```
>>> -2 ** 2
-4
```

In this example, `-2 ** 2` is equivalent to -(2<sup>2</sup>), which is equal to -4.

In situations like this, it's helpful to use brackets for clarification:

```
>>> -(2 ** 2)
-4
>>> (-2) ** 2
4
```

## Other resources

If you'd like to read some alternate explanations, or see some more examples, then you might find these resources helpful:
- [Real Python](https://realpython.com/)
  - This site has a tutorial on [expressions](https://realpython.com/python-operators-expressions/#augmented-assignment-operators) that covers the augmented assignment operators.
- [OverIQ](https://overiq.com/)
  - This site has a tutorial on [operators](https://overiq.com/python-101/operators-in-python/) that covers the augmented assignment operators and unary arithmetic operators.

## Practice exercises

We've run through the general concepts, and now we'll get some hands-on experience.

It can be tempting to jump right into running each exercise in the REPL, but it's best to try and predict the answers first.
That way, you'll have a clearer idea about which concepts you find more or less intuitive.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 2.11

```
>>> my_number = 4
>>> my_number
<answer 1>
>>> my_number += 3
>>> my_number
<answer 2>
>>> my_number += 5
>>> my_number
<answer 3>
```

### Exercise 2.12

```
>>> my_number = 15
>>> my_number
<answer 1>
>>> my_number -= 6
>>> my_number
<answer 2>
>>> my_number -= 2
>>> my_number
<answer 3>
```

### Exercise 2.13

```
>>> my_number = 2
>>> my_number
<answer 1>
>>> my_number *= 3
>>> my_number
<answer 2>
>>> my_number *= 5
>>> my_number
<answer 3>
```

### Exercise 2.14

```
>>> my_number = 100
>>> my_number
<answer 1>
>>> my_number /= 4
>>> my_number
<answer 2>
>>> my_number /= 5
>>> my_number
<answer 3>
```

### Exercise 2.15

```
>>> my_number = 33
>>> my_number
<answer 1>
>>> my_number %= 12
>>> my_number
<answer 2>
>>> my_number %= 7
>>> my_number
<answer 3>
```

### Exercise 2.16

```
>>> my_number = 17
>>> my_number
<answer 1>
>>> my_number //= 2
>>> my_number
<answer 2>
>>> my_number //= 3
>>> my_number
<answer 3>
```

### Exercise 2.17

```
>>> my_number = 2
>>> my_number
<answer 1>
>>> my_number **= 3
>>> my_number
<answer 2>
>>> my_number **= 2
>>> my_number
<answer 3>
```

### Exercise 2.18

```
>>> my_first_number = -7
>>> my_first_number
<answer 1>
>>> my_second_number = +9
>>> my_second_number
<answer 2>
>>> my_first_number * my_second_number
<answer 3>
>>> (+my_first_number) * my_second_number
<answer 4>
>>> my_first_number * (-my_second_number)
<answer 5>
>>> -(my_first_number * my_second_number)
<answer 6>
```

## Troubleshooting exercises

There's a few issues that people can run into when using augmented assignment operators and unary arithmetic operators in Python.
We've listed some of the most common ones here.

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 2.19

Why is an error being printed?

```
>>> 5 += 7
SyntaxError: cannot assign to literal
```

### Exercise 2.20

Why is an error being printed?

```
>>> my_number = 9
>>> my_number * = 6
SyntaxError: invalid syntax
```

### Exercise 2.21

Why is an error being printed?

```
>>> my_number = 12
>>> my_number =/ 3
SyntaxError: invalid syntax
```

### Exercise 2.22

Why do `my_first_number` and `my_second_number` have different values?

```
>>> my_first_number = 7
>>> my_first_number -= 3
>>> my_first_number
4
>>> my_second_number = 7
>>> my_second_number =- 3
>>> my_second_number
-3
```

### Exercise 2.23

Why do these expressions have different values?

```
>>> -3 ** 2
-9
>>> (-3) ** 2
9
```

### Exercise 2.24

Why is an error being printed?

```
>>> my_number *= 2
NameError: name 'my_number' is not defined
```

## Summary

We've reached the end of assignment operators, and at this point you should know:
- What the augmented assignment operators and unary arithmetic operators are,
- How to use augmented assignment operators to simplify updating variables,
- How to use arithmetic operators to change the sign of an expression.

Next up is [Chapter 3: Data Types](./03_data_types.md).

## Answers

### Exercise 2.11

1. 4
2. 7
3. 12

### Exercise 2.12

1. 15
2. 9
3. 7

### Exercise 2.13

1. 2
2. 6
3. 30

### Exercise 2.14

1. 100
2. 25.0
3. 5.0

### Exercise 2.15

1. 33
2. 9
3. 2

### Exercise 2.16

1. 17
2. 8
3. 2

### Exercise 2.17

1. 2
2. 8
3. 64

### Exercise 2.18

1. -7
2. 9
3. -63
4. -63
5. 63
6. 63

### Exercise 2.19

The `+=` augmented assignment operator is a combination of addition and assignment to a variable.
In particular, `5 += 7` is equivalent to `5 = 5 + 7`.
We're trying to assign to a value (i.e. 5) instead of a variable, which isn't valid.

### Exercise 2.20

`*=` is an augmented assignment operator.
The `*` and `=` have to be used in this order, without any characters in between.

### Exercise 2.21

`/=` is an augmented assignment operator.
`=/` looks very similar to `/=` (the augmented assignment operator) but the operators are in the opposite order, which isn't valid.

### Exercise 2.22

`-=` is an augmented assignment operator.
`my_first_number -= 3` means that `my_first_number` is assigned the current value of `my_first_number` (i.e. 7) minus 3.

`=-` looks very similar to `-=` (the augmented assignment operator), but it's handled differently.
Python evaluates `=-` by separating it into an assignment operator (`=`) and a unary arithmetic operator (`-`).
In this case, `my_second_number =- 3` is evaluated as `my_second_number =(- 3)`.

### Exercise 2.23

The unary arithmetic operators (`+` and `-`) have lower precedence than the exponentiation operator (`**`).
In the first expression, `3 ** 2` is calculated first (evaluating to 9), and then `-` flips the sign (evaluating to -9).
In the second expression, -3 is squared, evaluating to 9.

### Exercise 2.24

Augmented assignment operators can only be used on variables that have already been defined.
`my_number *= 2` means that `my_number` is assigned the current value of `my_number` multiplied by 2.
However, `my_number` hasn't been defined, so it doesn't currently have a value, making the command invalid.
