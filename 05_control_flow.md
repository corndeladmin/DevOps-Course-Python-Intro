# Chapter 5: Control Flow

## Chapter objectives

When you need to perform some logic rather than just carrying out the same calculation every time, you need **control flow** statements. The phrase "control flow" means how the program's "control" - the command currently being executed is the one in control - flows from line to line. It is sometimes called "flow of control" instead. 

In this chapter you will learn how to use Python's control flow blocks:

- Conditional execution: `if` / `elif` / `else`
- Loops: `while` / `for`

Like last chapter, try writing your code in a file rather than in the terminal, as we will be writing multi-line blocks.

## Conditional execution

### `if`

There will inevitably be lines or blocks of code that you only want to execute in certain scenarios. The simplest case is to run a line of code if some value is True. You can try putting this code in a file and running it:

```python
it_is_raining = True

if it_is_raining:
    print('bring an umbrella')
```

Set `it_is_raining` to False instead, and the print statement will not run.

Any expression can be used as the condition, not just a single variable. You will often use boolean operators in the expression, for instance:

```python
if you_are_happy and you_know_it:
    clap_your_hands()
```

> Python will actually let you put any data type in the `if` statement. Most objects will be treated as True, but there are a few things which are treated as False:
> - `0`
> - An empty string: `''`
> - An empty collection, like `[]` or `{}`
> - `None`
>
> A little care is needed but it means you can write something like `if my_list:` as shorthand for `if len(my_list) > 0:`

### A point on indentation

The `if` statement introduces an indented code block similarly to function definitions. If you are already writing indented code and then write an `if` statement, you will need to indent another level. There's no real limit to how far you can nest code blocks, but it quickly becomes clumsy. We will discuss the idea of "clean" code more in Module 2.

```python
def do_the_thing():
    if True:
        print('Inside an if-block, inside a function')
        if True:
            print('We need to go deeper')
    print('Inside the function, but outside the ifs')

print('Outside the function')
do_the_thing()
``` 

### `else`

Maybe you have two blocks of code, and you want to execute one **or** the other depending on some condition. That's where `else` comes in.

```python
def say_hello(name):
    if (name == 'world'):
        print('Enough of that now')
    else:
        print(f'Hello, {name}!')

say_hello('world')
say_hello('friend')
```

> You can also write an expression of the form `result_one if my_bool else result_two`. This is known as the ternary or conditional operator. This will check the value of `my_bool` and then return `result_one` or `result_two`, if `my_bool` was True / False respectively. You can write any expression in place of `result_one`/`my_bool`/`result_two`
> For example:
> greeting = f'Hello, {name}!'

### `elif`

There is also `elif` (an abbreviation of "else if"). Use this when you have a second condition to check if the first one was False, to decide whether to carrying out a second action instead. It needs to follow immediately after an `if` block (or another `elif` block), and like an `if` statement, you provide an expression and then a colon. You can follow the `elif` with an `else` statement, but you don't have to.

Here is an example where we will potentially apply one of two discounts, but _not both_.

```python
if customer.birthday == today:
    apply_birthday_discount()
elif number_of_items > 5:
    apply_bulk_order_discount()
```

You can also use it to check a third or fourth condition... in fact, there's no limit to how many `elif` statements you can join together. Note that the code will only execute for the first `True` condition, or the `else` will execute if none of the conditions were met. So you want to put the more specific checks first. Try running this code and check it prints what you expect.

```python
number_of_apples = 1
if number_of_apples > 10:
    print('I have a lot of apples')
elif number_of_apples > 5:
    print('I have some apples')
elif number_of_apples == 1:
    print('I have an apple')
else:
    print('I have no apples')
```

### Exercise 5.1

Modify this code so that it _does_ apply both discounts when both conditions are True.

```python
birthday_is_today = True
number_of_items = 10
price = 10.00

if birthday_is_today:
    price = price * 0.85
elif number_of_items > 5:
    price = price * 0.9

print(price)
```

<details><summary>Answer</summary>

Change the `elif` to an `if` and both blocks can execute:

```python
birthday_is_today = True
number_of_items = 100

if birthday_is_today:
    print('apply birthday discount')
if number_of_items > 5:
    print('apply bulk discount')
```

</details>

### Exercise 5.2

Write a function that takes a string as input and returns the middle character of the string. If there is no middle character, return `None` instead.

E.g. `your_function('abcd')` should return `None` and `your_function('abcde')` should return `'c'`

<details><summary>Hints</summary>

- `len(my_string)` will give you the length of a string
- `my_int % 2` will give 1 or 0 for odd and even numbers respectively
- `x // 2` will give you the **integer** result of x divided by 2.

</details>

<details><summary>Answer</summary>

```python
def get_middle_character(input):
    length = len(input)

    # Return None for strings with an even length
    if length % 2 == 0:
        return None

    # Otherwise return the middle character
    # This could be inside an "else:" block but there is no need to.
    return input[length // 2]

# For example this will print 'c'
print(get_middle_character('abcde'))
```

</details>

## Loops

What if you want to repeat a block of code a hundred times without having to write `my_function()` a hundred times? And maybe you want to keep running it forever?

Or what if you have a sequence, like a list of objects and you want to do something with each of them in turn?

This is where loops come in. There are two different loops: `for` and `while`.

### `for`

The `for` loop lets you run a block of code repeatedly. It's called a loop because the last line connects back to the start. The syntax to start the "for loop" is `for loop_variable in an_iterable:`. 
- An **iterable** is actually quite general. It's any object that you can ask for the "next item". A straightforward example is a `list`.
- You can pick any variable name in the place of `loop_variable`.
- This `for` line is followed an indented block of code, just like ifs or functions.
- On each trip around the loop, the "loop variable" will automatically get updated to the next item in the iterable. 

Try running the following example. The print statement will run five times because the list contains five items, and the `number` variable will have a different value each time:

```python
for number in [1, 2, 3, 4, 5]:
    print(number)
```

A list is a "sequence" - simply an ordered collection of values. We have already seen another example of sequences: strings. Similarly to lists, you can loop over each character in a string:

```python
for character in 'foobar':
    print(character)
```

Dictionaries are an example of an iterable that is not a sequence. Its items are not in an indexed order, but you **can** write `for i in my_dictionary:`. If you do, then `i` will be equal to each **key** of the dictionary in turn. If you want the key and value, then you can use `for key, value in my_dictionary.items():` - this will iterate over each key/value pair in turn.

### Exercise 5.3

Add together all of the numbers in a list (without using the built-in `sum` function)

For example, given this line of code, can you write code that will print `100`?

```
number_list = [5, 15, 30, 50]
```

<details><summary>Hint</summary>

Before you start the loop, create a variable to hold the running total. Add to the running total inside the loop.

</details>

<details><summary>Answer</summary>

```python
number_list = [5, 15, 30, 50]
result = 0
for number in number_list:
    result += number # the same as: result = result + number
print(result)
```

</details>

### Exercise 5.4

Write a function, `find_strings_containing_a`, which takes a list of strings and returns just the ones containing the letter 'a'. So after you define the function, the following code should print `['some cats', 'a dog']` to the terminal.

```python
full_list = ['the mouse', 'some cats', 'a dog', 'people']
result = find_strings_containing_a(full_list)
print(result)
```

Use the `in` operator to check if one string is contained within another string.
- `'foo' in 'foobar'` is `True`
- `'x' in 'foobar'` is `False`.

You can use the `append` method of lists to add an item to it.

<details><summary>Answer</summary>

```python
def find_strings_containing_a(strings):
    result = []
    for string in strings:
        if 'a' in string:
            result.append(string)
    return result
```

This is a good example of where you might want a [list comprehension](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions) instead of a for-loop:

```python
def find_strings_containing_a(strings):
    return [ string for string in strings if 'a' in string]
```

</details>

### `range`

A useful function for generating a sequence of numbers to iterate over. The result is its own data type, a `range`, but you can loop over it just like looping over a list.

The syntax is `range(start, stop, step)`. All three parameters are integers, but can be positive or negative
- `start` is the first number in the range. It is optional and defaults to `0`.
- `stop` is the when the range stops. It is **not** inclusive, i.e. the range stops just before this number. 
- `step` is the size of the step between each number. It is optional and defaults to `1`.

This example will print the numbers 0 to 9 inclusive:

```python
for i in range(10):
    print(i)
```

If you provide two arguments, they are used as `start` and `stop`. So this example will print the numbers 11 to 14 inclusive:

```python
for i in range(11, 15):
    print(i)
```

Here's an example with all three parameters, and using negative numbers. Can you correctly guess what it will print?

```python
for i in range(10, -10, -2):
    print(i)
```

> Note that if the range would never end, then it is empty instead. E.g. a loop over `range(1, 2, -1)` will simply do nothing.

### Exercise 5.5

Write a function that prints a piece of text 100 times. But please use a `for` loop and a `range`, rather than copying and pasting the print statement 100 times.

<details><summary>Answer</summary>

```python
def print_a_hundred_times(text):
    for current in range(100):
        print(text)
```

</details>

### Exercise 5.6

Write a function that takes a positive integer `n`, and returns the sum total of all square numbers from 1 squared to n squared (inclusive).

For example, with n = 3 your function should return 14 (equal to `1 + 4 + 9`) 

<details><summary>Answer</summary>

```python
def sum_cubes_to_n(n):
    result = 0
    for current in range(1, n + 1):
        result += current**2
    return result
```

</details>


### `while`

There's another type of loop that checks a condition each loop (potentially forever) rather than going through each item in a collection.

Do you understand what the following script does? What will it print?

```python
x = 1
while x < 100:
    x = x * 2

print(x) 
```

<details><summary>Answer</summary>It will keep doubling `x` until it is over 100 and then print it out. So in the end it prints 128</details>

For a loop that never ends, you can use `while True:`. If you accidentally end up with your terminal stuck running an infinite loop, then press `Ctrl + C` to interrupt it.

### `break` and `continue`

Two keywords to help navigate loops are `break` and `continue`. These apply to both `while` and `for` loops.
- `break` exits the for loop completely. It "breaks out" of the loop.
- `continue` ends the current loop early and "continues" to the next one

Read the following code and see if you can predict what will get printed out. Then run it and check your understanding.

```python
for i in range(10):
    print(f'Start loop with i == {i}')
    if i == 3:
        print('Break out')
        break
    if i < 2:
        print(f'Continue')
        continue
    print('End loop')
```

### Exercise 5.7

Can you make this code print just **A**, **B** and **C**, by adding some code before the print statement? Don't modify the two lines of code already there, just add some more lines of code before the line `print(letter)`

```python
for letter in ['A', 'B', 'X', 'C', 'D', 'E']:

    # your code here

    print(letter)    
``` 

<details><summary>Answer</summary>

```python
for letter in ['A', 'B', 'X', 'C', 'D', 'E']:
    if letter == 'D':
        break
    if letter == 'X':
        continue
    
    print(i)
```

</details>

## Revisiting the Shopping Cart

You can now revisit the [Shopping Cart Exercise](./Exercises/03_shopping_cart.md). This time, write a function that takes `shopping_cart` as a parameter, and prints out the three values as before. But you should now loop over the list of purchases so you can handle _any_ shopping cart.

To make it even better, add a second function parameter, `discounts`. It should be a list of the current discounts, for example: `[{'item': 'apple', 'discount': '0.5'}]`. Instead of your script always discounting apples by 50%, instead check each item in the shopping cart for a matching item in the list of discounts. 

## Summary

We've now reached the end of chapter 5. At this point you should know how to use:
- `if` / `elif` / `else` statements
- `while` or `for` loops 
- The `range` function
- The keywords `break` and `continue` inside loops

The next chapter (coming soon) will cover using multiple files together in a project and installing/importing other modules.
