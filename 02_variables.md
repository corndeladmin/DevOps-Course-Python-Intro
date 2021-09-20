---
title: "Chapter 2: Variables"
description: Storing values in nicely labelled boxes
---

# Chapter 2: Variables

## Chapter objectives

We've learned how to perform calculations, but we don't yet have a way to store our results!
We'll fix that now with the introduction of variables.

In this chapter you will:
- Learn what variables are, and how they can be used,
- Practice defining and overwriting variables,
- Practise using variables in expressions.

## What are variables?

Variables provide storage for values, allowing them to be retrieved and used later.
The assignment operator (`=`) is used to define a variable and give it a value:

```
>>> number_of_apples = 10
>>> number_of_apples
10
```

In this example, the newly defined variable's name is `number_of_apples`, and its value is 10.

> In the REPL, you can type the name of a variable and press enter to print the variable's value.
>
> Variable names can only contain letters, numbers, and underscores.
> A variable name must not start with a number.
>
> The Python convention for variable names is to use snake_case, as shown above. Other languages may use other conventions such as numberOfApples.

Once a variable has been defined, its value can be overwritten by using the assignment operator (`=`) again:

```
>>> number_of_pears = 2
>>> number_of_pears
2
>>> number_of_pears = 3
>>> number_of_pears
3
```

Variables can also be used in expressions:

```
>>> number_of_apples = 4
>>> number_of_pears = 5
>>> total_fruit = number_of_apples + number_of_pears
>>> total_fruit
9
```

## Another way of thinking about variables

Variables can be compared to storage boxes:

| Variables                           | Storage boxes                         |
|-------------------------------------|---------------------------------------|
| Defining a variable                 | Creating a box and putting an item it |
| Overwriting the value in a variable | Replacing the item in the box         |
| Accessing a variable                | Checking what item is in the box      |

In this analogy, the variable is a storage box, and the variable's value is an item in the box.

## Why use variables?

Variables are sometimes necessary.
For example, a program might ask a user to input a value, and then perform various calculations based on that value.
If the program didn't store the value in a variable, it would have to repeatedly ask the user to enter the value for each calculation.
However, if the program stored the value in a variable, it would only have to ask for the value once, and then store it for reuse.

Variables are also commonly used to simplify expressions and make code easier to understand.

Can you guess what this calculation is for?

```
>>> 200_000 * (1.05 ** 5) - 200_000
55256.31...
```

> Underscores (`_`) can be used as thousands separators in numbers.

It's actually calculating how much interest would be added to a loan over a period of 5 years if no payments were made.

Imagine this was a line of code in a codebase.
Any developers who stumble across this line probably wouldn't know exactly what the calculation is for.
They might have to spend some time trying to figure it out from context, or even track down the person who wrote it.

Ideally, we would find a way to write this calculation so that its purpose is immediately clear to everyone.
This approach makes it much easier to revisit old code that you previously wrote, and it's absolutely vital when collaborating with other developers.

```
>>> initial_loan_value = 200_000
>>> interest_rate = 1.05
>>> number_of_years = 5
>>>
>>> current_loan_value = initial_loan_value * (interest_rate ** number_of_years)
>>> total_interest = current_loan_value - initial_loan_value
>>>
>>> total_interest
55256.31...
```

Unfortunately, we're now using a few more lines of code than before.
However, more importantly, anyone who comes across this code will have a much easier time understanding it and working with it.
Concise code is desirable, but it shouldn't come at the expense of readability!

## Other resources

If you'd like to read some alternate explanations, or see some more examples, then you might find these resources helpful:
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/2e/)
  - [Chapter 1](https://automatetheboringstuff.com/2e/chapter1/) provides a more detailed introduction to variables.
- [Real Python](https://realpython.com/)
  - This site has a tutorial on [variables](https://realpython.com/python-variables/) that also describes how they work behind the scenes.

## Practice exercises

We've run through the general concepts, and now we'll get some hands-on experience.

It can be tempting to jump right into running each exercise in the REPL, but it's best to try and predict the answers first.
That way, you'll have a clearer idea about which concepts you find more or less intuitive.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 2.1

Use the REPL to run these commands:

```
>>> my_first_number = 5
>>> my_second_number = 7
>>> my_third_number = 11
>>> my_total = my_first_number + my_second_number + my_third_number
>>> my_total
<answer>
```

### Exercise 2.2

Use the REPL to run these commands:

```
>>> my_number = 3
>>> my_number
<answer 1>
>>> my_number = 4
>>> my_number
<answer 2>
>>> my_number = 8
>>> my_number
<answer 3>
```

### Exercise 2.3

Use the REPL to run these commands:

```
>>> my_first_number = 5 * 6
>>> my_second_number = 3 ** 2
>>> my_third_number = my_first_number - my_second_number
>>> my_third_number
<answer>
```

### Exercise 2.4

Use the REPL to run these commands:

```
>>> side_length = 5
>>> area = side_length ** 2
>>> area
<answer 1>
>>> side_length = 7
>>> area = side_length ** 2
>>> area
<answer 2>
```

## Troubleshooting exercises

There's a few issues that people can run into when using variables in Python.
We've listed some of the most common ones here.

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 2.5

Why is an error being printed?

```
>>> my_first_number = 1
>>> my_third_number = my_first_number + my_second_number
NameError: name 'my_second_number' is not defined
```

### Exercise 2.6

Why is an error being printed?

```
>>> my_first_number = 2
>>> my_second_number = 3
>>> my_first_number + my_sedond_number
NameError: name 'my_sedond_number' is not defined
```

### Exercise 2.7

Why is an error being printed?

```
>>> my_first_number = 1
>>> my_second_number =
SyntaxError: invalid syntax
```

### Exercise 2.8

Why is an error being printed?

```
>>> my first number = 1
SyntaxError: invalid syntax
```

### Exercise 2.9

Why is an error being printed?

```
>>> 1my_first_number = 1
SyntaxError: invalid syntax
```

### Exercise 2.10

Why is an error being printed?

```
>>> my-first-number = 1
SyntaxError: cannot assign to operator
```

## Summary

We've reached the end of chapter 2, and at this point you should know:
- What variables are, and how they can be used to store values,
- How to define and overwrite variables,
- How to use variables in expressions.

To see how to combine arithmetic operators with variable assignment, see [Chapter 2B: Assignment Operators](./02B_assignment_operators.md).

Or for the essentials, move on to [Chapter 3: Data Types](./03_data_types.md).

## Answers

### Exercise 2.1

23

### Exercise 2.2

1. 3
2. 4
3. 8

### Exercise 2.3

21

### Exercise 2.4

1. 25
2. 49

### Exercise 2.5

Python requires variables to be defined before they can be used.
In this case, a variable called `my_second_number` is used without first being defined.

### Exercise 2.6

The variable called `my_second_number` is misspelled as `my_sedond_number`.

### Exercise 2.7

The assignment operator requires both a variable name and a value.
In this case, the value is omitted.

### Exercise 2.8

Variable names can only contain letters, numbers, and underscores.
In this case, a space is used in the variable's name.

### Exercise 2.9

Variable names must not start with a number.

### Exercise 2.10

Variable names can only contain letters, numbers, and underscores.
In this case, hyphens are used in the variable's name.
