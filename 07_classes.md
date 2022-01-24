---
title: "Chapter 7: Classes"
description: How to define your own types and why. 
---

# Chapter 7: Classes

## Chapter objectives

Classes are a very important concept for writing a full-fledged application in Python because they will help keep your code clean and robust.

In this chapter you will learn:

- What a "class" is and why they are useful
- What "instance", "attribute" and "method" mean
- How to define and use classes
    - Classes can get very complex but we will cover the core features

## What is a class?

In Python 3, a class is a type; a type is a class. The only difference is that people tend to refer to the built-in types as "types" and user-defined types as "classes". There can be more of a distinction in other languages (including Python 2).

> For a recap on "types", refer back to Chapter 3.

Say you define a `Dog` class. This is where you decide what it means to be a Dog
- What data is associated with each Dog?
- What can a Dog do?

Someone's pet dog is an **instance** of that class (an object of type `Dog`). You use the class to construct instances.

Data or functions can be stored on the class itself or on individual instances, but the class generally defines how the object looks/behaves and then you provide specific data to instances.

> You could also think of the difference between "class" and "instance" like the difference between a recipe and a cooked meal. A recipe won't fill you up but it could tell you the necessary ingredients and the number of calories. The `Dog` class can't chase a ball, but it can define how dogs do chase balls.

There are multiple reasons classes are useful. They will help you to follow some of the principles of "good" object-oriented programming, such as the five "SOLID" principles, which are covered in detail in module 2 of the course. But fundamentally a class does two things:
- Store data on an object ("attributes")
- Define functions alongside that data/state ("methods")

## Defining a class

To define a class in Python, write the keyword `class` followed by a name for your new class. Put the following code in a new file. Here we will use the `pass` keyword to say that it's deliberately empty, similar to how you would define an empty function.

```python
class Dog:
    pass
```

> In a real project you will often put a class in its own module (i.e. file) in order to keep the project organised and easier to navigate. You then import the class in another file to actually use it. E.g. `from dog import Dog` if you put it in a file called dog.py. These exercises won't ask you to do so but feel free to try it out for practice.

You create an instance of the class by calling the class like a function - i.e. adding parentheses `()`. Add this code to your file, under the class definition:

```python
my_dog = Dog()
print(Dog)
print(my_dog)
``` 

You should see:
- `Dog` is a class (`<class '__main__.Dog'>`)
- `my_dog` is a Dog (`<__main__.Dog object at 0x000001F6CBBE7BB0>`)
    - The long hexadecimal number is a memory address (it will vary) but it usually won't be of interest
    - You can define your own text representation for your class, but we haven't yet.

### Class naming convention

In Python, any class names you define should be in `PascalCase`. This isn't a *requirement*, but will help developers read the code. The first letter of each word should be capitalised, including the first, and no underscores should be used. It is sometimes also called "CamelCase" but that is ambiguous - `camelCase` can have a lowercase first letter.

The different naming convention compared to variables and functions (which use `snake_case`) should help you keep track of whether you're handling a class definition or an instance of that class. You can write `dog = Dog()` and be sure the "dog" variable is an instance and "Dog" is the class itself. 

> The built-in classes like `str`, `int`, `datetime` are a bit of an exception to this rule.

### Attributes

You don't want to pass around multiple variables (like `dog_name`, `owner`, `breed` etc) for each dog that passes through the system. So our Dog class can be useful simply by grouping those variables together into a single entity (a `Dog`). Data classes are simple classes that hold data and don't necessarily provide any functionality beyond that.

> This _could_ be achieved with a dictionary but a class is more robust. The class definition is a single source of truth for what it means to be a Dog. You can ensure that every Dog in your system has the same shape. Dictionaries are less reliable - key/value pairs can be added/removed at any point and it's not obvious where to look to find out what your dictionary must/can contain.

You can also for example make some of the dog's data constant or optional, by changing the `Dog` class definition.

Let's try to make the class more useful by actually storing some data in the object. Python is quite liberal and you can get/set any **attributes** you want on your instance:

```python
my_dog = Dog()
my_dog.name = 'Rex'
print(f"My dog's name is {my_dog.name}")
```

Anything stored on the object is known as an **attribute**. Here, we have added a `name` attribute to the `my_dog` object.

If you try to access an attribute that wasn't set, you will get an error. Try accessing `my_dog.foobar` and you will see a message like the following:

```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'Dog' object has no attribute 'foobar'
```

But setting new attributes in this way is not ideal. We want every instance of this class to have the same, predictable shape, i.e. we want to guarantee every dog has a name. We don't want instances missing an attribute, and we want it to be easy for developers to discover all of the dog's attributes by reading the class definition. We will now write some code inside the class to achieve that.

### Methods

When we put a function on our object, it's known as a **method**. Technically it's also still an attribute, but you will usually stick to calling the variables "attributes" and the functions "methods".

Define a function called `__init__` inside the class. The function name needs to be exactly "`__init__`", and then it will automatically be in charge of creating new instances. We no longer want the `pass` keyword because the class is not empty anymore.

```python
class Dog:
    
    def __init__(self):
        self.name = 'Rex'
```

Instance methods all have a `self` parameter which will point to the instance itself. You do not need to call the `__init__` method yourself - when you run `my_instance = MyClass()`, it gets executed automatically. It's known as the **constructor** because it is responsible for constructing a new instance.

You can use the `self` parameter to update the new dog. Try it out: construct a dog, and then print out the dog's name.

<details markdown="1"><summary>Complete code</summary>

```python
class Dog:
    def __init__(self):
        self.name = 'Rex'

dog = Dog()
print(f"My dog's name is {my_dog.name}")
```

</details> 

But this still isn't terribly useful. Each dog should have a different name. So let's add a parameter to the constructor. The first parameter is always `self` and then any additional parameters follow. When you construct an instance, only pass in values for the additional parameters.

<details markdown="1"><summary>Complete code</summary>

```python
class Dog:
    def __init__(self, name):
        self.name = name

rover = Dog('Rover')
spot = Dog('Spot')
print(f"First dog: {rover.name}")
print(f"Second dog: {spot.name}")
```

</details> 

> The double underscores in the function name "`__init__`" indicate that it is a **magic method**. These are specific method names that get called implicitly by Python. Many other magic methods exist - for example, if you want a nice string representation of your class (useful for logging or debugging), define a method called `__str__` that takes `self` and returns a string.

### Exercise 7.1

Define a `Notification` class that has two attributes:
- `message` should be set via a constructor parameter
- `is_sent` should be equal to `False` for every new notification

And then use your class:
- Create a notification using your class.
- Print out its message
- Update its `is_sent` attribute to `True`.
- Create a second notification and check that it has `is_sent` set to `False`

<details markdown="1"><summary>Click here for the answer</summary>

```python
class Notification:
    def __init__(self, message):
        self.message = message
        self.is_sent = False

notification_one = Notification('Hello, world!')
print(notification_one.message)
notification_one.is_sent = True

notification_two = Notification('Goodbye!')


print(f'Notification One has been sent: {notification_one.is_sent}')
print(f'Notification Two has been sent: {notification_two.is_sent}')
```

</details>

### Linking functionality with state

Similar to the `__init__` method, you can define any other methods you want by including function definitions indented one level inside the class block. All instance methods should have at least one parameter - "self".

In Python, you could put all of your dog-related functions in a "dog_functions.py" module. But putting them in the `Dog` class could be nicer. E.g. imagine you want a function `is_healthy_weight` that tells you whether an individual dog is healthy based on the data you hold about it. Putting it in a module means you need something like this:

```python
import dog_functions

my_dog_is_healthy = dog_functions.is_healthy_weight(my_dog)
```

If the function is part of the Dog class, then using it looks like this:

```python
my_dog_is_healthy = my_dog.is_healthy_weight()
```

### Exercise 7.2

Here is a definition of a class that stores the position and velocity of an object in terms of x,y coordinates.

```python
class MovingThing:
    def __init__(self, x_position, y_position, x_velocity, y_velocity):
        self.x_position = x
        self.y_position = y
        self.x_velocity = x_velocity
        self.y_velocity = y_velocity
```

Add a method to it called `update_position` that has no parameters (apart from `self`). This should update the object's position after a unit of time has passed, meaning its `x_position` should increase by `x_velocity` and its `y_position` should increase by `y_velocity`.

Then create an instance of your class and demonstrate your method works correctly.

Can you make your `update_position` method take a `time` parameter instead of always progressing time by "1"?

<details markdown="1"><summary>Click here for the answer</summary>

```python
class MovingThing:
    def __init__(self, x_position, y_position, x_velocity, y_velocity):
        self.x_position = x
        self.y_position = y
        self.x_velocity = x_velocity
        self.y_velocity = y_velocity

    def update_position(self):
        self.x_position += self.x_velocity
        self.y_position += self.y_velocity

moving_thing = MovingThing(0, 10, 3, 1)
print(f'Original position: ({moving_thing.x_position}, {moving_thing.y_position})')

moving_thing.update_position()
print(f'Position after one update: ({moving_thing.x_position}, {moving_thing.y_position})')

moving_thing.update_position()
moving_thing.update_position()
print(f'Position after two more updates: ({moving_thing.x_position}, {moving_thing.y_position})')
```

To take a time parameter:
```python
    def update_position(self, time):
        self.x_position += self.x_velocity * time
        self.y_position += self.y_velocity * time
```
</details>

### Exercise 7.3

Here is a class definition and some data in the form of a list of dictionaries. 

```python
class Publication:
    def __init__(self, author, title, content):
        self.author = author
        self.title = title
        self.content = content

dictionary_data = { 
    'title': 'Lorem Ipsum',
    'main_text': 'Lorem ipsum dolor sit amet...',
    'author': 'Cicero'
}
```

**Part 1:** Convert the data from the dictionary to a Publication object 

<details markdown="1"><summary>Click here for the answer</summary>

Note:
- The three arguments should be passed to the constructor in the correct order.
- The dictionary uses the key "main_text" instead of "content". 

```python
my_publication = Publication(dictionary_data['author'], dictionary_data['title'], dictionary_data['main_text'])
```

You can spread it over multiple lines if you find that easier to read:

```python
my_publication = Publication(
    dictionary_data['author'],
    dictionary_data['title'],
    dictionary_data['main_text']
)
```
</details> 

**Part 2:** Now here is a list of dictionaries. Convert this list of dictionaries to a list of Publication objects. Imagine that the list could be of any size.

```python
raw_data = [{'title': 'Moby Dick', 'main_text': 'Call me Ishmael...', 'author': 'Herman Melville' }, {'title': 'Lorem ipsum', 'main_text': 'Lorem ipsum dolor sit amet...', 'author': 'Cicero'}]
```

<details markdown="1"><summary>Click here for a hint</summary>
Use a for-loop or a list comprehension to perform a conversion on each list item in turn. Here is an example of converting a list, but instead of multiplying a number by two, you want to extract data from a dictionary and construct a Publication. 

```python
original_list = [1, 2, 3]

list_via_for = []
for item in original_list:
    list_via_for.append(item * 2)

list_via_comprehension = [ item * 2 for item in original_list ]
```

Both `list_via_for` and `list_via_comprehension` are now equal to `[2, 4, 6]` 
</details> 

<details markdown="1"><summary>Click here for the answer</summary>

Here is the answer achieved two ways.

```python
list_via_for = []
for item in raw_data:
    publication = Publication(item['author'], item['title'], item['main_text'])
    list_via_for.append(publication)

list_via_comprehension = [ Publication(item['author'], item['title'], item['main_text']) for item in original_list ]
```
</details> 

**Part 3:** It turns out that your application needs to display text of the form "title, by author" in many different places. Add a `get_label` method to the class, which returns this string. 

> This is an example of writing a "utility" or "helper" function to avoid duplicated code. You define the logic once and can reuse it throughout the application. It could be written as a "normal" function rather than a method, but this way you don't have to import anything extra and it's easy to discover.

<details markdown="1"><summary>Click here for the answer</summary>

```python
class Publication:
    def __init__(self, author, title, content):
        self.author = author
        self.title = title
        self.content = content

    def get_label(self):
        return f'{self.title}, by {self.author}'
```
</details> 

**Part 4:** Loop through your list of Publication objects and print each one's "label".

<details markdown="1"><summary>Click here for the answer</summary>

```python
for publication in list_of_publications:
    print(publication.get_label())
```
</details> 

### Exercise 7.4

Define a class to represent users.
- Users should have `name` and `email_address` attributes, both set in the constructor via parameters.
- Add a `uses_gmail` method, which should return True or False based on whether the email_address contains "@gmail". 

> **Hint:** Use the `in` keyword to check if a substring is in a larger string. Eg: `'foo' in 'foobar'` evaluates to `True`. 

<details markdown="1"><summary>Click here for the answer</summary>

```python
class User:
    def __init__(self, name, email_address):
        self.name = name
        self.email_address = email_address

    def uses_gmail(self):
        return '@gmail' in self.email_address
```

</details> 

## Troubleshooting exercises

### Exercise 7.5

Fix this class definition. There are three issues.

```python
class Dog:
    def __init__(real_age, self):
        age_in_dog_years = real_age * 7

def bark(self):
    print('Woof!')
```

The fixed class definition should work with the following code and end up printing two lines: `Age in dog years: 70` and `Woof!`.

```python
dog = Dog(10)
print(f"Age in dog years: {dog.age_in_dog_years}")
dog.bark()
```

<details markdown="1"><summary>Click here for the answer</summary>

- `self` should be the first parameter of `__init__`
- You need to set the `age_in_dog_years` on the self object. Otherwise, it's just a local variable inside the function that gets discarded at the end of the function.
- The `bark` function should be indented in order to be a part of the class (a method of `Dog`). 

```python
class Dog:
    def __init__(self, real_age):
        self.age_in_dog_years = real_age * 7

    def bark(self):
        print('Woof!')
```

</details> 

## Class attributes

It is possible to define attributes that belong to the class itself rather than individual instances. You set a class attribute by assigning a value to it inside the class, but outside any function.

```python
class MyClass:
    class_attribute = 'foo'

    def __init__(self):
        self.instance_attribute = 'bar'
```

You can get it or update it via `MyClass.class_attribute`, similar to instance attributes but using the class itself rather than an instance.

If you try to access `my_instance.class_attribute`, it will first check if an instance attribute exists with that name and if none exists, then it will look for a class attribute. This means you can use `my_instance.class_attribute` to get the value of 'foo'. But setting the value this way (`my_instance.class_attribute = 'new value'`) will set an instance attribute. So it will update that single instance, not the class itself or any other instances.

This could be useful for a variety of reasons:
- Storing class constants. For example, all dogs do have the same species name so you could set a class attribute `scientific_name = 'canis familiaris'`.
- Tracking data across all instances. For example, keep a count of how many dogs there are in total.
- Defining default values. For example, when you construct a new dog, maybe you want to set a `plays_well_with_cats` variable to false by default, but individual dogs could choose to override this.

### Exercise 7.6

Create a `Dog` class with a `count` class attribute. Every time you construct a new dog, increment this value

<details markdown="1"><summary>Click here for the answer</summary>

```python
class Dog:
    count = 0
    
    def __init__(self, name):
        self.name = name
        count += 1
```

</details> 

### Exercise 7.7

```python
class Cat:
    disposition = 'selfish'

    def __init__(self, name):
        self.name = name

felix = MyClass('Felix')
mog = MyClass('Mog')

felix.disposition = 'friendly'
felix.name = 'Handsome Felix'
```

Part 1:

After the above code runs, what do these equal?
- `Cat.disposition`
- `mog.disposition`
- `mog.name`

Part 2:

If you now ran `Cat.disposition = 'nervous'`, what would these equal?
- `felix.disposition` 
- `mog.disposition`

<details markdown="1"><summary>Click here for the answers</summary>

Part 1:
- 'selfish'
- 'selfish'
- 'mog'

Part 2:
- 'friendly'
- 'nervous'

</details> 

## Class methods

You can create "class methods" by putting `@classmethod` on the line above the function definition. Where instance methods have a "self" parameter that is equal to the instance being used, class methods have a "cls" parameter that is equal to the class itself.

```python
class MyClass:
    signature = 'foobar'
    
    @classmethod
    print_message(cls, message):
        print(message)
        print(cls.signature)
```

> The difference between using `cls.signature` and `MyClass.signature` inside the class method is that `cls` can refer to a child class. See the section on inheritance for further information. If in doubt, use `cls` when you can.

There are also "static methods" in Python (`@staticmethod`) but we're not going to look at them now. In short, they belong to the class but don't have the `cls` parameter. They should not directly use an instance or the class itself and mainly serves as a way of grouping some functions together within a module.

## Inheritance

An important aspect of classes (in almost all languages) is **inheritance**. Say you're developing a system that can draw various shapes, though for simplicity we're just going to print text to the terminal. All of your shapes have some things in common - they have a colour, a position on the canvas, etc.

How do you write that without copying and pasting a bunch of code between your classes?

We can define a base class Shape that all of the different types of shapes inherit from.

```python
class Shape:
    def __init__(self, colour):
        self.colour = colour

    def draw(self):
        print('')

class Dot(Shape):
    def draw(self):
        print('.')
```

The key part is the `(Shape)` when we start the definition of `Dot`. We say that the `Shape` is a **base class** or **parent class** or **superclass**, while `Dot` is the **derived class** or **child class** or **subclass**. 

When we create a `Dot`, it inherits all of the behaviour of the parent class, `Shape`. We haven't defined an `__init__` function for Dot, so it automatically uses the parent class's one. When we construct a Dot, we have to pass in a "colour":

```python
my_dot = Dot('black')
print(my_dot.colour)
```

But if we do define something that the parent already defined, the child's one will get used. With the example above, that means running `my_dot.draw()` will print a "." rather than nothing.

Here is a second child class:

```python
class Rectangle(Shape):
    def __init__(self, colour, height, width):
        super().__init__(colour)
        self.height = height
        self.width = width

    def draw(self):
        print('🔲')
```

If you want to use a parent method, you can do so via `super()` as shown above. This is useful when you want to keep some behaviour and extend it.

In this way, your code can show logical relationships between your types of objects (Rectangle inherits from Shape => "a Rectangle is a Shape"), and you can define code in one place that gets used in multiple classes. Python's classes have more features that we've not covered, for example we could use the "abstract base class" module (`abc`) to declare that the "draw" method needs to be implemented in child classes and not in the "abstract" Shape class. You could read about some features [online](https://docs.python.org/3/tutorial/classes.html) or when using classes in Module 2 of the course.

## Summary

You have now reached the end of chapter 7. At this point you should know:
- What classes are and why they're useful
- How to define a class, including:
  - Defining a constructor
  - Setting instance or class attributes
  - Defining instance or class methods
- How to construct instances and access attributes/methods
- How to use inheritance to share functionality between related classes

There are other features of classes in Python that we haven't touched on, such as:
- Multiple inheritance (a child class with multiple parents)
- Abstract classes (using the `abc` module)
- The `@property` decorator
- The `@dataclass` decorator
- "Type annotations" let you benefit even more from classes

But you will get the opportunity to see these in Module 2 of the course.
