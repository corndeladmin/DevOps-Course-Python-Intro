# Chapter 1: Installing Python and using the REPL

## Chapter objectives

Python's wide range of functionality has helped to make it one of the most popular programming languages in use today.
However, before we can dive in and try out everything Python has to offer, there's a few things we need to do first!

In this chapter you will:
- Learn about Python and its uses,
- Install Python on your computer,
- Learn about the Python REPL,
- Use the Python REPL to perform calculations.

## Some helpful resources

If you get stuck or confused while working through this chapter then you might find these resources helpful:
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/2e/)
  - The [Introduction](https://automatetheboringstuff.com/2e/chapter0/) & [Chapter 1](https://automatetheboringstuff.com/2e/chapter1/) cover installing Python and give an overview of its core concepts.
- [Python.Land](https://python.land/)
  - This site has tutorials on [installing Python](https://python.land/installing-python), [starting up the REPL](https://python.land/installing-python/starting-python), and [using the REPL](https://python.land/introduction-to-python/the-repl).

If you still feel lost after looking through these resources, then feel free to ask your trainer for some tips.

We want to make this course as easy to follow as possible, so it's really helpful for us to know if you're struggling with anything, or if you find any alternative explanations that make things click for you.

## First of all, what's Python?

Python is a general-purpose programming language.
It's designed for readability, so it's often chosen as a first programming language for people who are learning programming.
Python is a very flexible language, used throughout various industries and contexts, including DevOps.

## Installing Python

Let's start out by installing Python.

### Windows

- Download the latest Windows installer for Python from <https://www.python.org/downloads/windows/>.
  - You'll need to pick either the 32-bit or 64-bit installer, depending on your operating system.
  - You can check this in `Control Panel -> System -> System type`.
- Once the installer's finished downloading, run it to install Python.
  - Make sure to select the "Add Python to PATH" option when installing (see screenshot below).
  - This will make it easier to use Python from the command line.

![Python Install Options](./Images/python-windows-installer.png)

- Once the installer has completed, you should be able to open a terminal and run `python --version` to check that Python has been installed properly.

### Mac

- Download the latest macOS installer for Python from https://www.python.org/downloads/mac-osx/.
  - You'll need to pick either the `universal2` installer (for M1 Macs) or `Intel` installer (for other Macs).
- Once the installer's finished downloading, run it to install Python.
- Once the installer has completed, you should be able to open a terminal and run `python3 --version` to check that Python has been installed properly.

> Make sure to use `python3` instead of `python` in your terminal!
> Macs typically come with an older version of Python installed, and the older version is used when running the `python` command.

### Ubuntu/Debian

- You can install Python from a terminal by running `sudo apt-get install python3`.
- Once the installer has completed, you should be able to run `python3 --version` to check that Python has been installed properly.
	
> Make sure to use `python3` instead of `python` in your terminal!
> Ubuntu/Debian distributions typically come with an older version of Python installed, and the older version is used when running the `python` command.

## What's the Python REPL?

The Python REPL is an interactive computer program accessed using a terminal, such as PowerShell.
It can be used to run Python commands, and generally learn about Python's functionality.

REPL stands for Read, Evaluate, Print, Loop - this matches the way the REPL is used:
- First, a user types input (e.g. a mathematical expression) into their terminal,
- Next, the REPL reads the input and evaluates it,
- Finally, the REPL prints the result back to the terminal.

## That all sounds pretty abstract!

You might not have used a REPL (or even a terminal) before, but you've probably seen something similar - chat bots!

When interacting with a chat bot:
- First, the user types some input into a text box on a webpage,
- Next, the chatbot processes the input and "thinks" of a response,
- Finally, the chatbot writes the response to the same webpage.

We're using the REPL in the same way - the terminal is like the chatbot's webpage, and the REPL is like the chatbot itself.

## Starting the REPL

The REPL is accessed using a terminal, so start out by opening a terminal window.

Next:
- If you're on Windows, type `python` and press Enter.
- If you're on Mac or Linux, type `python3` and press Enter.

You should now see some output like this in your terminal:

```
Python 3.9.6 (tags/v3.9.6:db3ff76, Jun 28 2021, 15:26:21) [MSC v.1929 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
    
> The `>>>` prompt in the terminal means that your commands will be sent to the REPL from now on.

## Using the REPL

Now that we have the REPL up and running, let's evaluate some expressions!
Try typing `1 + 3` and pressing Enter.

You should see this in your terminal:

```
>>> 1 + 3
4
>>>
```

In this example:
- We entered `1 + 3` as an expression,
- The REPL evaluated the expression, calculating the result (`4`),
- The REPL printed the result back to the terminal,
- The `>>>` prompt is shown again, letting you know that the REPL is ready for another expression.

How about a different expression?
Try entering `7 + 2` instead.
You should see this:

```
>>> 7 + 2
9
>>>
```

As above, we entered `7 + 2` as an expression, the REPL calculated that the result is `9`, and then the REPL printed the result back to the terminal.

> You can exit the REPL by typing `exit()` and then pressing Enter.

## Hold on, what's an expression?

An expression is a combination of values (e.g. `7`, `2`) and operators (e.g. `+`).
Expressions can be evaluated by Python to produce a single value (e.g. `9`).

The REPL can also take _commands_ as input, which have a much wider range of functionality than expressions - we'll come across them later in the course.

## New, but familiar?

The REPL interface might seem unusual, but, you've probably come across something like this when using Excel.
In Excel, we can type a formula like `= 5 + 2` in a cell, and Excel will calculate the result for us and put it in the cell.
We can enter similar expressions in the REPL, and it will calculate and print out the result.

Perhaps even more familiar, it might feel like you're using a calculator on your computer!

This is only a small portion of Python's functionality, and we'll see much more in the upcoming chapters.

## Practice exercises

We've run through the general concepts, and now we'll get some hands-on experience.

It can be tempting to jump right into running each exercise in the REPL, but it's best to try and predict the answers first.
That way, you'll have a clearer idea about which concepts you find more or less intuitive.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 1.1

Try starting and exiting the REPL a few times, using the same commands we introduced earlier in this chapter.

### Exercise 1.2

Use the REPL to perform these calculations:

1. `15 + 19`
2. `1 + 2 + 3`
3. `60 - 5`
4. `7 - 9`
5. `5 > 4`

> We've introduced a new operator here: `-`, used to subtract numbers.
> We'll look at other mathematical operators in the next chapter, along with operator "precedence".
> We have also introduced the "greater than" operator, `>`, to compare two numbers. The result of using `>` is not a number, but `True` or `False`. This is a different data type, which we will discuss in chapter 3.

## Troubleshooting exercises

There's a few issues that people can run into when getting started with Python and the REPL.
We've listed some of the most common ones here.

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

> You can check your answers for each exercise at the end of this chapter.

### Exercise 1.3

Why can't the terminal find the `python` (Windows) or `python3` (Mac/Linux) command?

```
$ python
python: command not found
```

### Exercise 1.4

Why are expressions failing to evaluate?

```
$ 1 + 2
1: command not found
```

## Summary

We've reached the end of the first chapter, and at this point you should:
- Have Python installed on your computer,
- Know how to start up and close the Python REPL,
- Know how to use the REPL to evaluate expressions.

For a deeper look at some arithmetic operators, see [Chapter 1B: Arithmetic Operators](./01B_arithmetic_operators.md).

For the essentials, move on to [Chapter 2: Variables](./02_variables.md).

## Answers

### Exercise 1.1

Once you've started the REPL, you should see the `>>>` prompt at the start of the next terminal line.
This means that your next command will be sent to the REPL, and any expressions you enter will be evaluated.

After you've exited the REPL, you shouldn't see the `>>>` prompt.
This means that the REPL isn't running anymore, and it won't receive any expressions you enter.

### Exercise 1.2

1. 34
2. 6
3. 55
4. -2
5. True

### Exercise 1.3

The `python` command can't be found because Python hasn't been installed yet, or hasn't been installed properly.

One reason for this could be that you installed Python on Windows but `python` hasn't been added to the `PATH` environment variable. We will discuss "PATH" in module 4, but if you are in this situation, try updating it:

On Windows, click Start and search for ‘edit environment variables’, or open System properties, Advanced system settings and click the Environment Variables button. In this dialog, you can add or modify User and System variables.
Select "Path", click "Edit" and then click "New" in the second dialog that appears. You want to enter the **folder** containing the `python.exe` file. It will likely be roughly `C:\Users\YOUR-USERNAME\AppData\Local\Programs\Python\Python39` but try to locate the correct folder on your system.

### Exercise 1.4

The REPL isn't running, and isn't receiving the expressions.
After starting up the REPL, there should be a `>>>` prompt in the terminal.
