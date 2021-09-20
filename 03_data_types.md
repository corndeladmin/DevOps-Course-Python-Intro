---
title: "Chapter 3: Data Types"
description: What "type" means, and a look at Python's most common types
---

# Chapter 3: Data Types

## Chapter objectives

We've learned how to perform calculations, but computers are more than just calculators. You will need to handle some things other than numbers.

In this chapter you will:
- Learn what data types are
- Practise using some common types that are built into Python
  - Numbers
  - Booleans
  - Strings
  - Lists
  - Dictionaries

Follow along on the REPL to check you can use the data types as shown in the examples.

## What is a data type?

There are fundamentally different kinds of data that look and behave differently. Are you calculating a number or building a list of users? You should try to stay aware of the "type" of every expression and variable you write. 

If you try to treat a piece of text like a number, your command might fail (aka "raise an exception"), or it might just behave surprisingly. 

For example, let's return to the first operator we looked at: `+`. The meaning of `x + y` is very different depending on what exactly x and y are. 

If they are numbers, it adds them as you expect:

```
>>> 1 + 2
3
```

But if they are text values (known as "strings"), then it joins them together (a.k.a. concatenates them):

```
>>> 'Hello, ' + 'World!'
'Hello, World!'
>>> '1' + '2'
'12'
```

If `x` and `y` are different types or don't support the `+` operator, then Python might fall over:

```
>>> 'Foobar' + 1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: can only concatenate str (not "int") to str
```

The error message on the last line is trying to explain the problem. It says that you can only add strings to other strings (abbreviated to `str`). You cannot add an integer (abbreviated to `int`) to a string.  

Now let's look at some data types in more detail. For a more thorough list of Python's built-in types, you could consult the [official docs](https://docs.python.org/3/library/stdtypes.html), but we'll go over the essentials here.


## Numbers (int, float)

We have so far only used numeric values. It is worth being aware that there are actually different types of numbers - whole numbers (aka integers) or non-integers (aka floating point numbers). The abbreviations for these are "int" and "float".

This is often not a big deal as Python will happily run expressions combining integers and floats, as you may have done already, but they are in fact different types. 

```
>>> 1 + 2
3
>>> 1 + 2.0
3.0
>>> 1.5 + 1.6
3.1
>>> 3 == 3.0
True
```

> Something to be aware of is that floating point calculations [inevitably involve rounding](https://docs.python.org/3/tutorial/floatingpoint.html). There is a separate type, [Decimal](https://docs.python.org/3/library/decimal.html), that solves the problem for many scenarios, but that goes beyond the scope of this course.

## True / False (bool)

There are two boolean values, `True` and `False`, which are fairly self-descriptive. There are various operators that can produce booleans by comparing values. For example:
- `1 < 2` means "1 is less than 2", so this returns True. Similarly, `>` means "greater than".
- `1 <= 2` means "1 is less than or equal to 2". Similarly, `>=` does what you expect.
- `1 == 2` means "1 is equal to 2", so this returns False. Notice there must be two equals signs, as a single equals sign is used for assigning values, e.g. when creating a variable.
- `1 != 2` means "1 is not equal to 2", so this returns True. 

Try writing some comparisons in the REPL and check that they return what you expect.

There are also Boolean operators for combining them:
- `a and b` is True if both `a` and `b` are True
- `a or b` is True if either of `a` or `b` (or both) are True
- `not a` is True if `a` is False

E.g.

```
>>> True and False
False
>>> True or False
True
>>> not False
True
```

> In Python, you can actually use other data types in Boolean expressions. Most values will be considered True but some special values are False, such as `0`. 

### Exercise 3.1

Copy these two lines into the REPL. Write a single expression that uses these variables to tell you whether you're going to have a bad time on your walk.

```
>>> it_is_raining = True
>>> you_forgot_your_umbrella = True
```

Can you do the same thing using these variables?

```
>>> it_is_raining = True
>>> you_have_your_umbrella = False
```

<details>

<summary>Click here for the answer</summary>

```python
>>> it_is_raining and you_forgot_your_umbrella
True
>>> it_is_raining and not you_have_your_umbrella
True
```

</details>

## Text (strings)

A text value is known as a **string** (or abbreviated to `str`). To create a string, just write some text wrapped inside quotation marks, like `"Hello"`. This is called a **string literal** (a "literal" just means "what you'd need to type at the REPL or in code to get that value" - so `"Apple"` is the literal for the string "Apple", `4` is the literal for the integer 4, and you'll see later in this document list literals `[1, 2, 3]` and dictionary literals `{ name: 'Joseph' }`). You can use single or double quotes to make your string - the only difference is the ease of including quotation marks inside the text itself. If you want to include the same type of quotation mark as part of the text value, you need to "escape" it with a backslash.

```python
>>> "example text" == 'example text'
True
>>> "I'm a string" == 'I\'m a string'
True
```

### Building a string

To build a string using some other values, you have three options:

1. You can try putting it together yourself with the `+` operator. "String concatenation" means joining two or more values together, one after the other. Note that this will not convert other data types to strings automatically.

```python
>>> 'I have ' + '2 apples'
'I have 2 apples'
>>> number_of_apples = 2
>>> 'I have ' + str(number_of_apples) + ' apples'
'I have 2 apples'
```

> There are built-in functions to convert between data types. `str(2)` converts the number 2 into a string, '2'. Similarly, `int('2')` converts a string into an integer. We will look at functions in more detail next chapter, but for now, try using these - you write the function name, like `str`, followed by parentheses around the value you want to convert.

2. A **formatted string literal** or "f-string" is written with an `f` before the first quote. It lets you insert values into the middle of a string. This pattern is known as "string interpolation" rather than concatenation and is often the clearest way to write it. You can also specify details, like how many decimal places to display.

```python
>>> number_of_apples = 2
>>> f'I have {number_of_apples} apples'
'I have 2 apples'
>>> kilos_of_apples = 0.4567
>>> f'I have {number_of_apples:.3f}kg of apples'
'I have 0.457kg of apples'
```

3. There is another way of performing interpolation - the `format` method of strings. There can be situations where it looks neater, but this is often just the older and slightly messier way of doing the same thing. One useful application of `format` is storing a template as a variable to fill in later.

```python
>>> number_of_apples = 2
>>> 'I have {} apples'.format(number_of_apples)
'I have 2 apples'
>>> template = 'I have {} apples'
>>> template.format(number_of_apples)
'I have 2 apples'
```

### Exercise 3.2

If you've heard of Mad Libs, this exercise should be familiar. We'll pick some words and then insert them into a template sentence.

Set these four variables with whatever values you like:

```python
plural_noun = 'dogs'
verb_one = 'jump'
adjective_one = 'quick'
adjective_two = 'lazy'
```

a) Now write an expression that produces text like the following, where the four emphasised words are inserted using the correct variables.

> Computers are making us _quick_, more than even the invention of _dogs_. That's because any _lazy_ computer can _jump_ far better than a person.

b) Maybe you to generate text that puts the input word at the start of a sentence? You can use the `capitalize` method of a string to capitalise the first letter. E.g. `'foobar'.capitalise()` returns `'Foobar'`.

Use that to build this sentence:

> _Quick_ _dogs_ _jump_ every day. _Lazy_ ones never do. 

<details><summary>Click here for the answer</summary>

a) Note there is a `'` in the text, so let's use double quotes to wrap our string. The easiest form to read is an f-string:

```python
f"Computers are making us {adjective_one}, more than even the invention of {plural_noun}. That's because any {adjective_two} computer can {verb} far better than a person."

```

Or store the template in a variable to easily recreate it multiple times, with different values. 

```
>>> template = "Computers are making us {}, more than even the invention of {}. That's because any {} computer can {} far better than a person."
>>> template.format(adjective_one, plural_noun, adjective_two, verb)
```

b) You can call the `capitalize` method inside the f-string:

```
>>> f'{adjective_one.capitalize()} {plural_noun} {verb} every day. {adjective_two.capitalize()} ones never do.'
```

</details>


### Character access

You can access a specific character in a string with square brackets and the "index", which means the position of the character but counting from 0. Or you can consider it an offset. Either way, 0 means the first character, 1 means the second, and so on. It looks like this: 

```
>>> 'abc'[0]
'a'
>>> 'abc'[1]
'b'
```

### Exercise 3.3

Can you get the REPL to print out the fourth digit of this number? You will need to convert it to a string first, and then access a character by index.

```
>>> my_number = 123456
```

<details><summary>Click here for the answer</summary>

```
>>> my_number = 123456
>>> my_string = str(my_number)
>>> my_string[3]
4
```

The two actions can also be written on a single line:

```
>>> str(my_number)[3]
4
```

</details>

## Lists

A list is a way of grouping multiple items together in a single object (in a well-defined order). Each item in the list will usually be the same type, but they _can_ be anything, e.g. mixing numbers and strings. Mixing types is not typical and requires a lot of care. 

You create a list by opening a square bracket, writing values with commas between them, and then close the square brackets:

```
>>> shopping_list = ['milk', 'bread', 'rice']
>>> some_prime_numbers = [2, 3, 5, 7, 11]
```

You can access an individual item in the list by writing the _index_ of the item you want in square brackets. The index is the position of the item, but starting at `0` for the first item. This is just like accessing a character in a string.

```
>>> shopping_list[0]
'milk'
>>> shopping_list[1]
'bread'
```

> Rather than grabbing one by position, you will often want to go through the list and act on each item in turn. We will cover that in chapter 5.

We will discuss functions next chapter but here are three functions worth trying out: 
- `len` gives you the length of a list
- `append` is a function on the list itself that will add an item onto the end of the list

Here is how to use them:

```
>>> shopping_list = ['milk', 'bread', 'rice']
>>> len(my_shopping_list)
3
>>> my_shopping_list.append('eggs')
>>> my_shopping_list
['milk', 'bread', 'rice', 'eggs']
```

Try it out in the REPL.

### Exercise 3.4

Given a list of prime numbers, write an expression to get the tenth one.

```python
>>> some_prime_numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
```

<details><summary>Click here for the answer</summary>

```python
>>> some_prime_numbers[9]
29
```

</details>

## Dictionaries

This is another way of storing a collection of things. But instead of storing them in a list, you associate each one with a label for ease of access. They are called dictionaries because they can be used similarly to an actual dictionary - looking up the definitions of words. In this usage, the word you are looking up is the **key** and the definition is the **value**. You don't want to look up a definition based on its position in the dictionary, you want to look up a particular word.

Here is an example dictionary:

```python
>>> my_dictionary = { 'aardvark': 'insectivore with a long snout', 'zebra': 'stripy horse' }
```

You write a dictionary with _curly_ brackets instead of square. Inside it you have a comma-separated collection of key/value pairs. Each pair is written as `key: value`. The key will often be a string, in which case remember to wrap it in quotes. You can have as many key/value pairs as you want.

To retrieve a value, you use square brackets and the corresponding key:

```python
>>> my_dictionary['zebra']
'stripy horse'
```

This is the syntax to add new key/value pairs, or update an existing one:

```python
>>> my_dictionary['bee'] = 'buzzing thing'
>>> my_dictionary
{'aardvark': 'insectivore with a long snout', 'zebra': 'stripy horse', 'bee': 'buzzing thing'}
```

> Unlike a real dictionary we don't worry about storing the entries alphabetically, as we will access them directly.

Try creating, reading and updating some dictionaries via the Python terminal. The key can be a number, string or boolean, and must be unique - only the latest value you set for that key will be kept. The value can be anything at all.

### Exercise 3.5

I've finally gone shopping and have added two cartons of eggs to my shopping basket. Here is a Python dictionary to represent them:

```python
eggs = { 'name': 'Free Range Large Eggs', 'individual_price': 1.89, 'number': 2 }
```

Can you get the REPL to print the price per carton of eggs? Then can you calculate the total price?

<details><summary>Click here for the answer</summary>

```python
>>> eggs = { 'name': 'Free Range Large Eggs', 'individual_price': 1.89, 'number': 2 }
>>> eggs['individual_price']
1.89
>>> eggs['individual_price'] * eggs['number']
3.78
```

</details>

### Exercise 3.6

I would like an easy way to check who is currently staying in each room of my hotel.

Define a dictionary, which maps room numbers to lists of people (strings) occupying each room.

<details><summary>Click here for the answer</summary>

```python
>>> rooms = { 101: ['Joe Bloggs', 'Jane Bloggs'], 102: [], 201: ['Smith'] }
```

</details>

### Exercise 3.7

Using your dictionary from the previous question, can you write an expression to check if a room is free? i.e. it should evaluate to `True` if no one is in that room.

<details><summary>Click here for the answer</summary>

The more natural answer might be to check the list is empty, i.e. the name list for that room has a length of 0:

```python
>>> rooms = { 101: ['Joe Bloggs', 'Jane Bloggs'], 102: [], 201: ['Smith'] }
>>> len(rooms[101]) == 0
False
>>> len(rooms[102]) == 0
True
```

But you can also take advantage of the fact that an empty list is "falsy". It is treated like False when converted to a boolean. `bool([]) == False`

```python
>>> rooms = { 101: ['Joe Bloggs', 'Jane Bloggs'], 102: [], 201: ['Smith'] }
>>> not rooms[101]
False
>>> not rooms[102]
True
```

</details>

### Exercise 3.8

Dictionaries can contain anything as the value, including other dictionaries. This is very common, e.g. when parsing JSON data received from a web API.

Here is a dictionary with information about a user. The user has a name, age and address. The address is itself a dictionary.

```python
>>> user = { 'name': 'Jamie', 'age': 41, 'address': { 'postcode': 'W2 3AN', 'first_line': '23 Leinster Gardens' } }
```

Can you write an expression to get the user's address? Can you write an expression to get the user's postcode?

<details><summary>Click here for the answer</summary>

```python
>>> user['address']
{ 'postcode': 'W2 3AN', 'first_line': '23 Leinster Gardens' }
>>> user['address']['postcode']
'W2 3AN'
```

</details>

## When you have no data at all

There is a special value in Python, `None`, which has its own type, `NoneType`. It can be used to represent the absence of a value, such as when optional fields are missed out. It is also the result of a function that doesn't return anything else. The REPL won't print anything when an expression evaluates to None, but it's still there.

You may also end up encountering it because of a mistake. For example, do you remember the .append() method of lists that modifies an existing list? It doesn't return anything, so look at the behaviour of the following code:

```
>>> x = [1, 3, 2]
>>> y = x.append(4)
>>> y == None
True
>>> y
>>> str(y)
'None'
>>> y[0]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'NoneType' object is not subscriptable
```

Here is an example of using `None` deliberately:

Dictionaries have a `get` method, that you can use instead of the `my_dictionary['zebra']` syntax. The difference is what happens when the dictionary doesn't contain that key. The square brackets will throw an error but the get method will calmly return `None`. Try it out in the REPL: 

```
>>> my_dictionary = {'zebra': 'stripy horse'}
>>> my_dictionary.get('zebra')
'stripy horse'
>>> my_dictionary.get('grok')
>>> my_dictionary.get('grok') == None
True
```

Or you could specify a different fallback value for `get` if you want, by putting it in the parentheses. 

```
>>> my_dictionary.get('grok', 'no definition available')
'no definition available'
```

## Troubleshooting exercises

There are a few issues that people can run into when using different data types in Python.
We've listed some common ones here.

For each troubleshooting exercise, try and figure out what went wrong and how it can be fixed.

### Exercise 3.9

The final command here is throwing an error:

```python
>>> budget = '12.50'
>>> expenditure = 4.25 + 5.99
>>> expenditure < budget
```

Can you fix this? It should return `True`.

### Exercise 3.10

What is wrong with the following block of code? Can you fix the mistake?

```python
>>> my_string = 'Hello, world'
>>> my_dictionary = { 'greeting': 'my_string', 'farewell': 'Goodbye, world' }
```

<details><summary>Click here for a hint</summary>

What does `my_dictionary['greeting']` return?

</details>

<details><summary>Click here for the answer</summary>

```python
>>> my_string = 'Hello, world'
>>> my_dictionary = { 'greeting': my_string, 'farewell': 'Goodbye, world' }
```

</details>

### Exercise 3.11

Why does this produce an error instead of the string 'Alice'? Can you fix the mistake?

```
>>> user_by_id = { '159': 'Alice', '19B': 'Bob' }
>>> user_by_id[159]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 159
```

<details><summary>Click here for the answer</summary>

The error is saying that there is no key `159` because the key is a string `'159'`, not a number. When you try to fetch a value, you need to provide the correct key and the number `159` is **not** equal to the string `'159'`. 

```python
>>> user_by_id['159']
'Alice'
```

</details>

## Summary

We've reached the end of chapter 3, and at this point you should know:
- What data types are and why you need to be aware of the type of everything you use. 
- How to use some basic types:
  - Numbers
  - Booleans
  - Strings
  - Lists
  - Dictionaries

Other built-in types exist, and there is also a lot of functionality in these types that we haven't covered yet, but you now have the essentials. We will look at defining your own types (aka **classes**) in a later chapter.

Try this [Shopping Cart Exercise](./Exercises/03_shopping_cart.md) to put it all together.

Next up is [Chapter 4: Functions](./04_functions.md) - defining reusable blocks of code.
