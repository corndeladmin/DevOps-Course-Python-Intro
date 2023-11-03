---
title: "Exercise: Choose Your Own Adventure"
description: Use all your Python skills to create a game
---

## Exercise: Choose Your Own Adventure

Let's practise the things covered so far by writing a small game that you can play in the terminal. This will involve:
- Variables
- Data types 
  - In particular strings, but you may want lists and dictionaries for more complicated interaction
- Functions. You will at least use built-in functions but should define your own as the script becomes more complicated.
- Loops and `if` statements to control the logic
- You may need to import some built-in Python packages, or even install a new package

### Getting input

First, you'll need a way for the user to interact with the programme.

`input` is a built-in function that will let a user interact with the Python script. It has one (optional) parameter - a message to print to the terminal. Then it waits for the user to type a response, which will be the result of the function.

Create a new Python file and try it out. Example usage:

```python
user_input = input('Please type something: ')

print(f'You typed: "{user_input}"')
```

If you copy this code and then run your file, your terminal ask you to type something. After you type something and hit enter, the print statement will repeat your message back to you.

> The result of the function will always be a string. Even if they enter "123", that will be the string `"123"` not the integer `123`. If they enter nothing, it will be an empty string `""`.

### Running forever

Use a `while` loop to write a script that never completes. When you run your never-ending script, you can press `Ctrl+C` to force it to stop without closing the terminal. 

Let's give the user the option to quit instead. If they type "quit", then exit the script.

<details markdown="1"><summary>Click here for the answer</summary>

You can use the built-in function `quit` to quit the programme. Alternatively, in this example you could also use the keyword `break` to end the loop, which would allow the file to finish executing. To do so, replace `quit()` with `break` in the below code.

Using the `quit` function is a bit more generally applicable, e.g. if you have nested loops or you want to quit without executing any further code.

There is also a function `exit` that does the same thing as `quit`. You have likely used one of these already when you wanted to close the REPL.

```python
while True:
    user_input = input('Please type something: ')
    print(f'You typed: "{user_input}"')

    if user_input == 'quit':
        quit()
```

</details>

### Adventure

Now you can add some more logic so the script reacts to what the user types. Write a short Choose Your Own Adventure style story:
- Print some lines of story
- Print a list of options for what to do next and get the user to select one using `input`. You can ask them to to type just "A" / "B" rather than the full text.
- Progress the story depending on which option the user chose.

Some suggestions:
- If the user types something that your script doesn't recognise, ask them to try again.
- Try organising your code into functions to make it easier to read or to reuse certain blocks of code
- Use variables to keep track of the user's current location or their earlier decisions

It's entirely up to you how far you want to take this. See below for some features you could try adding:

## Stretch Goals

### Parsing input

Try making the user interaction a bit more open. Instead of giving the user a list of options, simply ask them "What do you do?" and try to interpret their input, i.e. **parse** the user's input. Example commands you might accept: `go north`, `examine lock`, `take key`. You may find these functions/operators useful for comparing strings:

- You may want to use the `lower` or `upper` methods of a string to do case-insensitive comparisons. E.g. `user_input.lower() == 'quit'` will be True even if the user types "Quit". 
- The `in` operator will return `True`/`False` for whether the left-hand string is contained in the right hand string. E.g. `'ab' in 'abc'` will return `True`.
- The `in` operator also lets you check if an object is contained in a list. E.g. `'foo' in ['foo', 'bar']`. So you can check for many possibilities at once.
- [The `split` instance method](https://docs.python.org/3/library/stdtypes.html#str.split) will turn a string into a list of strings based on any separator you want. Here is an example splitting the string by spaces: `'Open door'.split(' ')` will evaluate to `['Open', 'door']`. This would let you split the instruction into action and target.

In this way you can create a text adventure game, as open-ended as you want.

### Saving progress

You could save the user's progress so they don't have to start from the beginning every time they run the script. Either let the user enter a code at the start to skip to a certain point in the story, or use Python's functions for [reading and writing files](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files). 

### Graphics

If you are feeling very ambitious, you could install and use the [Pygame package](https://www.pygame.org/docs/tut/PygameIntro.html) to create a user interface instead of just using the terminal. Look at the documentation or search for examples online to get started.

## Getting feedback

If you would like any feedback on what you've written, then please feel free to share your work with the tutors via Slack or email (DevOpsDelivery@corndel.com).
