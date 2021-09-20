---
title: "Chapter 4: Functions"
description: Defining and then running reusable blocks of code
---

# Chapter 4: Functions

## Chapter objectives

At some point, as you try to achieve something more complex, you will want to divide your script into reusable chunks. 

In this chapter you will:
- Write and execute a Python file
- Learn what functions, arguments and return values are
- Practise writing and using functions
- Look at a few useful functions that come built into Python.

## Executing a Python file

Rather than just using the REPL, it will be easier to record our functions in a file.
Create a new folder on your machine where you're happy to store some scripts, and open that folder within VSCode (open VSCode, then `File -> Open Folder` on Windows or `File -> Open...` on a Mac). Within VSCode create a new file calling it whatever you like as long as you give it the `.py` file extension, say `test_script.py`.

Inside this file write some simple Python code, e.g.

```python
message = 'Hello, world!'
print(message)
```

> `print` is a built-in function to print something in the terminal. We can use this to conveniently demonstrate our script works as intended.

You can then execute this file from a terminal with `python test_script.py` (or use `python3` on a Mac). This needs to be your normal terminal, not inside a REPL. If you see the `>>>` prompt, then exit the REPL first.

> This example assumes your terminal is in the same directory as the file. Otherwise replace "test_script.py" with the correct file path. If you open a terminal within VSCode, it will start in the correct folder (select `Terminal -> New Terminal` from the menu bar at the top of the screen)

```bash
$ python test_script.py
Hello, world!
```

You can also run the file via VSCode if you have installed the Python extension. While viewing the file in VSCode, click the green play button in the top right of the screen. If you don't see the button, make sure you've saved the file first!

You can also run `python -i test_script.py` to open up a REPL once the file finishes executing. For example:

```bash
$ python -i test_script.py
Hello, world!
>>> 1 + 1
2
>>> message
'Hello, world!'
```

### Comments

When you start writing files, you will inevitably come across code comments. Some text starting with `#` is a "comment". It doesn't actually do anything - it just tells the reader something interesting. Try it out with a file like this:

```python
# I am a comment
# print('this will not print')

print('this will print') # comment at end of line
```

In a well-written codebase there shouldn't be much need for code comments, as the code should generally speak for itself. We describe that as "self-documenting" code. 

Bear in mind that comments don't just take time to write. The cost is ongoing:
- They obscure the code / take time to read
- They need to be kept up to date
- They lie (it's always a risk even if you try to keep them accurate)

Examples of bad comments:

```python
# x is cost per item
x = 10.99
# print cost per item
print(x)
```

The need for a comment is often an indication that the code should be improved instead, until it becomes self-documenting and a code comment would just repeat the code. That said, comments can certainly be useful. There are still plenty of reasons to write one. In short, good comments explain **why** the code is the way it is, rather than how it works.

For example:
- Working around surprising behaviour or a bug in another tool
- Explaining why something is not implemented yet
- Justifying use of a particular algorithm for performance reasons
- Citation or a link to a useful reference
- A slightly special case is documentation for a library or API, where the consumer is unable/unwilling to look at the code. Python has [docstrings](https://www.python.org/dev/peps/pep-0257/) for this purpose.

## What is a function?

We've learnt about some of the basic components of Python code, but to go from a simple program to more complex behaviour, we need to start breaking up that program into meaningful blocks. Functions will let us structure our code in a way that is easier to understand, and also easier to update.

A function is a block of code, ie a set of instructions. You give it a name when you define it, and then you "call" the function later to actually execute that code. Some functions will want you to pass data in, and some functions can return a result, but the simplest function definition is just sticking a label on a few lines of code.

You could also think of the function as a machine that you can operate as many times as you like. Its name should describe its purpose. It may take some input and/or produce some output. For example, a blender takes some ingredients as input, blends them together and you can pour out the output. Some functions could have neither, like winding up a toy car and watching it go.

> To make our code as "clean" as possible, we try to write functions that are well-named and short. Each one should serve a single purpose, not try to be a Swiss army knife. The idea of clean code will be discussed in more detail in Module 2 of the course.

## Basic syntax

To define a function in Python, start with the `def` keyword, followed by a name, a pair of parentheses and a colon. If you use the wrong type of brackets or forget the colon, it will not work. After that, write one or more _indented_ lines of code. Python is sensitive to indentation and will use it to see where the function ends. 

Here's a simple example:

```python
def hello_world():
    print('Hello, World!')
```

> Python's naming convention is `snake_case` for function names, just like variable names. The rules for a valid function name are the same as variable names, e.g. no spaces allowed.

Any indented lines of code below the `def` line are part of the function. When you stop indenting code, the function is complete and you are outside it again.

Copy the above example into a Python file and try running it. You'll see that it didn't actually say hello. To call a function, write its name followed by a pair of brackets. Try running a file that looks like this, and you should see the message appear in your terminal:

```python
def hello_world():
    print('Hello, World!')

hello_world()
```

Try defining and calling some functions.

## Methods

A function can also belong to an object; this is called a **method**. For example, strings have an `upper` method to return an uppercase copy of the string. The original is left unchanged. To call a method, you put a dot and the function name after the object. Try it out in the REPL:

```python
>>> whisper = 'hello, world'
>>> shout = whisper.upper()
>>> whisper
'hello, world'
>>> shout
'HELLO, WORLD'
```

Some methods might modify the object instead of just returning a value. We will look at defining our own methods when we create classes in a later chapter.

### Exercise 4.1

Lists have a `sort` method, which reorders the list from lowest value to highest. It modifies the list, and does not return anything. In the REPL, run the line below to create a list and assign it to a variable.

```
>>> my_list = [1, 4, 5, 2, 3]
```

Now try to sort that list and check it looks how you expect.

<details markdown="1"><summary>Click here for the answer</summary>

```python
>>> my_list = [1, 4, 5, 2, 3]
>>> my_list.sort()
>>> my_list
[1, 2, 3, 4, 5]
```

</details>

## Input

Functions often want to perform an action that depends on some input - your calculator needs some numbers, or your smoothie maker needs some fruit. To do this, name some **parameters** between the parentheses when defining the function. Inside the function, these will be like any other variable. When you call the function, you provide the actual values for these, aka **arguments**.

> The terms "argument" and "parameter" are often used interchangeably. Technically, a parameter refers to what is in the function definition and argument is the value that is passed in, but no one will really notice if you use them the other way around.

For example, create a file containing this code:

```python
def print_total_interest(initial_loan, interest_rate, number_of_years):
    repayment_amount = initial_loan * (interest_rate ** number_of_years)
    total_interest = repayment_amount - initial_loan
    print(f'£{total_interest:.2f}')

print_total_interest(1000, 1.05, 10)
```

We define a function that takes three arguments. We provide three numbers _in the correct order_ when we call the function. You should see `£628.89` printed to your terminal when you run the file.

Note that the variables created inside the function only exist inside the function - you will get an error if you try to access `total_interest` outside of the function.

When you call a function, you can explicitly name arguments as you pass them in, instead of relying on the order. But you are now reliant on the names. E.g.

```python
print_total_interest(number_of_years=10, initial_loan=1000, interest_rate=1.05)
```

> These are called **keyword arguments** and are most common when there are optional parameters. See the Module 1 PDF for how to declare optional parameters.

## Output

Maybe you don't just want to print things. Maybe you want to get a number back for the total interest so you can do something else with it. To get it out of the function, you need a `return` statement. This determines the output of your function, and also exits the function.

For example:

```python
def get_total_interest(initial_loan, interest_rate, number_of_years):
    repayment_amount = initial_loan * (interest_rate ** number_of_years)
    return repayment_amount - initial_loan

interest = get_total_interest(1000, 1.05, 10)
print(interest)
```

You could have multiple return statements when you have some logic to decide which line gets executed. We will see some examples of this next chapter.

## Practice exercises

We've run through the general concepts, and now we'll get some more hands-on experience.

Write your solution in a Python file and execute it (either from the command line or VSCode) to check it works.

> You can check your answers for each exercise as you go

### Exercise 4.2

Define a function called `greet_user`, that has one argument, `name`. It should print out a greeting such as `Hello, Smith`, but using the name that was given as a parameter. 

<details markdown="1"><summary>Click here for the answer</summary>

```python
def greet_user(name):
    print('Hello, ' + name)
```

</details>

### Exercise 4.3

Now add these lines to the bottom of your file from the previous question. And after that, call your `greet_user` function to greet them.

```python
name_one = 'Jane'
name_two = 'Joe'
```

<details markdown="1"><summary>Click here for the answer</summary>

```python
greet_user(name_one)
greet_user(name_two)
```

</details>

### Exercise 4.4

Write a function that has one parameter - a _list_ of words - and _returns_ the word that comes first alphabetically.

Call your function on a list of words to show it works.

<details markdown="1"><summary>Click here for a hint</summary>

First, use the `.sort()` method on the list. Next, `return` the word at index 0.

</details>

<details markdown="1"><summary>Click here for the answer</summary>

```python
def get_first_word_alphabetically(words):
    words.sort()
    return words[0]

my_first_word = get_first_word_alphabetically(['Zebra', 'Aardvark'])
print(my_first_word)
```

</details>

## Troubleshooting exercises

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

### Exercise 4.5

Can you fix this script so that the final line prints "Success!"?

```python
def do_the_thing():
    # pretend this function does something interesting
    return 'Success!'

result = do_the_thing
print(result)
```

<details markdown="1"><summary>Click here for the answer</summary>

You need to include brackets to call the function:

```python
result = do_the_thing()
```

</details>

### Exercise 4.6

If you try to put this function definition in a file, you get an error. Running the function should print the number 2. Can you fix it? Note, there are multiple issues.

```python
def do_the_thing[]
two = 1 + 1
print(two)
```

<details markdown="1"><summary>Click here for the answer</summary>

- You need parentheses, not square brackets
- You need a colon
- The contents need to be indented

```python
def do_the_thing():
    two = 1 + 1
    print(two)
```

</details>

### Exercise 4.7

What do you think this code does? 

```python
def make_a_sandwich(filling):
    sandwich = ['bread', filling, 'bread']
    return sandwich
    print(sandwich)

my_sandwich = make_a_sandwich('cheese')
```

If you try running this, you will see nothing is getting printed out. Can you fix it?

<details markdown="1"><summary>Click here for the answer</summary>

The `return` statement will exit the function - later lines will not execute. So let's move it after the print statement.

```python
def make_a_sandwich(filling):
    sandwich = ['bread', filling, 'bread']
    print(sandwich)
    return sandwich

my_sandwich = make_a_sandwich('cheese')
```

</details>

## Summary

We've reached the end of chapter 4, and at this point you should know:
- What functions are and how they help you structure/reuse code. 
- How to define functions, including specifying parameters
- How to invoke functions, including passing in arguments

Next up is [Chapter 5: Control Flow](./05_control_flow.md) - running code only when a condition is met.

See below for some extra points regarding functions in Python:

## Some extras

### Functions in the REPL

While you'll definitely want to write longer scripts in a file, you can still experiment with functions in the REPL if you wish:
- Write your `def` line as normal
- The prompt will change from `>>>` to `...` when you are "inside" the function, but you still need to start each line with some spaces. Be consistent with how many spaces you use for the indentation.
- When you have finished defining the function, hit enter with a totally blank line to exit the function and you will see the prompt return to `>>>`.

For example:

```
>>> def example():
...   print('Indented with two spaces')
...   print('Also indented')
...
>>> example()
Indented with two spaces
Also indented
```

### Empty functions

Note that a function cannot be empty. If the function is totally empty, the file will fail to run with an "IndentationError". But maybe you want to come back and fill it in later? In that case, there's a keyword `pass` that does nothing and just acts as a placeholder. 

```python
def do_nothing():
    pass

do_nothing()
```

### Functions as objects

In Python, functions are actually objects with a data type of "function". If you don't put brackets on the end to call the function, you can instead pass it around like any other variable. Try running the following code:

```python
def my_function():
    print('My function has run')

def call_it_twice(function):
    function()
    function()

call_it_twice(my_function)
```

### Decorators

You will eventually come across code that looks like the following:

```python
@example_decorator
def do_something():
    pass
```

The first line is applying a **decorator** to the function below. The decorator transforms or uses the function in some way. The above code won't actually work unless you define "example_decorator" - it's just illustrating how it looks to use a decorator.
