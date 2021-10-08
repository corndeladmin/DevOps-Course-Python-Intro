---
title: "Chapter 6: Packages, Modules and Imports"
description: And using Poetry to manage dependencies 
---

# Chapter 6: Packages, Modules and Imports

## What are these words?

The simple picture is:
- Each Python file is a **module**
- A folder is a **package**. Just like folders containing files/subfolders, a package contains modules/subpackages.
- For your module (file) to access code from another, you must first **import** it

By importing a module, you ensure the file has run and you get access to anything that it has defined (like variables or functions). 

> This analogy doesn't always hold up - packages and modules don't *need* to derive from the file system - but it's correct for most purposes. 

For example, look at this file structure:

```
parent/
    __init__.py
    module_a.py
    first/
        __init__.py
        module_b.py
        module_c.py
    second/
        __init__.py
        module_b.py
```
Here, we have a `parent` package containing a module (`module_a`), and two subpackages, `first` and `second`. The subpackages contain their own modules. There's nothing stopping them reusing filenames. The convention is to use short, lowercase names. Use snake_case if you need multiple words.

> Each folder needs to contain a file called `__init__.py` in order to be a regular package rather than just a **namespace**. Namespaces can be spread over multiple folders in totally different locations. If in doubt, include the `__init__.py` file. The file can be left blank.

## The `import` statement

A simple import statement looks like this: `import example`.

This will search for:
- A subdirectory called `example` in the **current working directory** (more on this later)
- **Or** a file called `example.py` in the current working directory
- **Or** an installed package called `example`

Let's try it out:
- Open up a folder in VS Code
- Create a python file, e.g. `example_module.py`, that contains these lines:
  ```python
  print('example_module.py is executing')
  foo = 'Hello'
  bar = 'World'
  ```
- Open the REPL in the same folder
- Notice that `foo` and `bar` are not defined:
```
>>> foo
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'foo' is not defined
```
- Run `import example_module`. Now you can access `example_module.foo` and `example_module.bar`.
- Now run `from example_module import foo`. This lets you access `foo` directly instead of including its module name each time.
  > The difference between `from x import y` and `import x` is just style. Importing a whole module is often preferable because it's clearer, but it can lead to long-winded code.
- Import multiple things at once with commas: `from example_module import foo, bar`
- Notice that even if you import the module multiple times, it only printed its message once. But if you restart the REPL, you can get the message to print again.

> You can import everything from a module by using `from my_module import *` but this is **not** recommended. It introduces unknown names and makes your code less readable.

### Exercise 6.1

Let's try out some packages from the Python Standard Library. They come installed with Python, but you will need to import each of them whenever you want to use them.

- Print out the current working directory by using the `getcwd` function from the `os` module ([documentation here](https://docs.python.org/3/library/os.html))
- Print out pi to 10 decimal places, using the `math` module for the value of pi ([documentation here](https://docs.python.org/3/library/math.html))
- Print out the current date and time using the `datetime` module ([documentation here](https://docs.python.org/3/library/datetime.html))
    - Note that the `datetime` module contains [several types](https://docs.python.org/3/library/datetime.html#available-types) including a `datetime` type. This is different from the `datetime` module itself - `datetime.datetime` is a different object from `datetime`. 
    - Optional: look at the `strftime` method for how to customise the formatting of the datetime.

<details markdown="1"><summary>Click here for the answers</summary>

```python
import os

print(os.getcwd())
```

```python
import math

print(f'{math.pi:.10f}')
```

```python
import datetime

now = datetime.datetime.now()
print(now)
print(now.strftime('%d/%m/%y %H:%M'))
```

</details>

### Navigating folders

Create a package containing some modules:
- Create a subfolder (`package`), with two modules inside (`module1.py` and `module2.py`) and a blank file called `__init__.py`.
- Declare some variables or functions inside those module files.

In the *parent folder* above the folder called "package", create a file `main.py`. This "main" file is going to import those other modules.

To import a module that lives in another package, prefix it with the package name and a dot (not a slash) or import it "from" the package, i.e. do either of the following:
- `import package.module1`
- `from package import module1` 

Try it out! Add import statements to `main.py` and demonstrate that it is successfully accessing variables or functions defined by `module1.py`/`module2.py`.

> Note that the syntax continues in this way for folders within folders, e.g. `from folder.subfolder.subsubfolder import module`.
> You can still import an object directly with `from package.module1 import foo` (if module1.py defines something called foo)

If you want to import both, you might try to run `import package` and then access `package.module2` but you will see that **doesn't** work. Submodules do not get imported automatically - you must import each one explicitly, e.g. `from package import module1, module2`.

> Automatic import of submodules *can* be done by including them in the package's `__init__.py` file, but we're not going to look at that now.

What if module1 wants to import module2? The statement you need at the top of `module1.py` is the same as what you would put in `main.py`, e.g. `from package import module2`.

Try it out:
- In module2, define a variable
- In module1, import module2 as described above and `print` its variable
- In your `main.py` file, import module1
- Run the `main.py` file

Note that you cannot run module1.py directly now. It will fail to find module2. This is because the import statement will search relative to the "current working directory", which is the directory of the "top level script" (main.py in the example). If you run the module1 file directly, then the current working directory is the package folder, and your import statement would need to be `import module2` but then this would not work with main.py.

When you open the REPL, the "current working directory" is just the current directory.

> It also searches other locations, which is how it will find things from the Python library or other installed packages. You normally won't need to worry about managing this.

> Relative imports exist: `from . import my_adjacent_module` will import a file in the same folder or `from .my_subpackage import my_module` will find something in a subfolder. You might want relative imports *within* a package of closely related modules so that you can move it around more easily. But in general, stick to absolute imports. The "top level script" (main.py in this example) cannot use relative imports.

### Aliases

One final feature of the import statement is using an alias for the imported object.

```python
import datetime as dt
```

This lets you rename the imported object to whatever you want, if you think it will make the current file easier to read or to avoid conflicts. The above rename of the `datetime` module lets you define your own variable called `datetime` without issue.

There are some fairly common aliases for some of Python's built-in modules, like the above, and for some 3rd party packages, like the NumPy package is usually imported as `np`. But how to use aliases is down to personal preference (or your team's preference). Like with most things, consistency will be the most important consideration for readable code.

### Exercise 6.2

Create two packages, `package1` and `package2`. Within each package, create a module called `my_module`. In each of the files called `my_module.py`, declare some variables. From your `main.py` file in the root folder, import both modules so that the modules can be accessed directly. For example, what import statements would let you run the following code, assuming each module defined their own `example_var` variable?

```python
print(my_module1.example_var)
print(my_module2.example_var)
```

<details markdown="1"><summary>Click here for the answer</summary>

```python
from package1 import my_module as my_module1
from package2 import my_module as my_module2

print(my_module1.example_var)
print(my_module2.example_var)
```

</details> 

## Installing Dependencies

There are many Python packages that are not built into Python but are available on the public [PyPi](https://pypi.org/) server for you to download and use in your script/project. You can also connect to your own private PyPi server - you might privately publish packages to share between projects, or your organisation might curate a smaller set of packages that are vetted as trustworthy and secure enough for use.

The package manager that is built into Python is a command line tool, `pip`. 
If your Python scripts folder was not added to your path, access pip via `python -m pip` or `python3 -m pip` on a Mac. Otherwise you should be able to access it directly with `pip`.

There is thorough [documentation](https://pip.pypa.io/en/stable/getting-started/) available, but here is the core functionality:

- You can install the latest version of a package with: `pip install package-name`
- You can use a [version specifier](https://pip.pypa.io/en/stable/cli/pip_install/#requirement-specifiers) for better control over the version: `pip install package-name=1.0.0`
- To generate a snapshot of your currently installed packages: `pip freeze`. But note that this includes "transitive dependencies", meaning the thing you installed wants to install something else too.
- List your dependencies in a file and then install them with: `pip install -r requirements.txt`. The requirements.txt file should have one package per line, with the same options for versioning as the install command.

It's worth being aware of how to use pip though we will be using a tool called Poetry (see below) instead of using the `pip` command line tool directly.

### Virtual envs

What if you have two projects on your computer, A and B, with different dependencies? They could even depend on different versions of the same package. How do you reliably run the two projects without your setup for project A affecting project B?

The solution is to give each project its own copy of the Python interpreter and its own library of installed packages. "Python interpreter" means Python itself - the program that reads your `.py` files and does something with them. This copy of Python is known as a **virtual environment**. The impact of this on running Python is when you are trying to run project A or update its packages, make sure you are using project A's copy of Python (i.e. its virtual environment). When running project B, use project B's virtual environment.

You can manage a virtual environment with Python's [built-in tool called "venv"](https://docs.python.org/3/tutorial/venv.html), but on this course we will be using a 3rd party tool called Poetry (see below).

### Poetry

On this course we are going to use [Poetry](https://python-poetry.org/docs/) to manage both your project dependencies and the virtual environment to isolate those dependencies from the rest of your system. Follow their [installation instructions](https://python-poetry.org/docs/#installation).

Under the hood it will use pip to install dependencies, but it's nicer to work with and has some useful features. 

The key thing developers expect from a good package manager is to enable repeatable builds: 
- If I don't deliberately change my dependencies, then I should be able to download the exact same packages every time I build the application. 
- Building it on my computer should reliably be the same as building it on yours.

Updating or adding new dependencies should still be effortless.

> Sometimes you install packages that install their own dependencies in turn. Those nested dependencies that you aren't accessing directly are the **transitive dependencies**. There could be multiple levels of nesting. Poetry lets us use the same versions of those each build without us having to list them ourselves. `pip freeze` doesn't make it clear which dependencies are things you actually care about / which are transitive dependencies.

There will be up to three Poetry files in the top folder of the project.
- `pyproject.toml` contains some information about your project in case you want to publish it, as well as a list of your project's direct depenencies. 
- `poetry.lock` contains a list of all the packages that were installed last time and exact versions for all of them. This is generate when you use Poetry to install required packages.
- `poetry.toml` is an optional file for configuration options for the current project, e.g. whether to create a virtual environment.

Some other tools exist with similar goals - Pipenv, pip-tools, Conda - but Poetry is coming out on top as a tool that achieves everything we need.

The core commands are:
- `poetry init` to add Poetry to a project. This only needs to be done once.
- `poetry add package-name` to install a new package **and** automatically update your pyproject.toml and poetry.lock files as necessary. With just pip, you'd have to run multiple commands to achieve this.
- `poetry install` to install everything that the current project needs (as specified by pyproject.toml).
- `poetry show` to show your dependencies
- `poetry run ...` to run a shell command using Poetry's virtual environment for the current project. E.g. `poetry run python` will open up a REPL using the virtual environment's copy of Python, so the correct packages should be installed. `poetry run python my_app.py`.

### Exercise 6.3

Run through Poetry's example from their documentation which shows how to add a dependency to a project:

<https://python-poetry.org/docs/basic-usage/>

### Selecting an interpreter in VS Code

For your IDE (such as Visual Studio Code) to read your code correctly when you are installing packages to a virtual environment, it will also need to point to that virtual environment. In VS Code, click on the Python version towards the left of the blue bar at the bottom of the screen to open up the `Select Interpreter` prompt. Select the correct copy of Python (or type the file path).
> You can also open the prompt by opening the Command Palette with `Ctrl + Shift + P` on Windows or `Cmd + Shift + P` on a Mac. Start typing `> Python: Select Interpreter` and then select the option when it appears.

To find the location of your Poetry virtual environment's folder, you can run the command `poetry env info`. When you "Select Interpreter", you need to point VS Code to the executable itself - so inside the virtual environment folder, find `Scripts/python.exe` on Windows or `bin/python` on a Mac.

### Exercise 6.4

The following examples do not currently work. For each one, try to identify the problem(s).

1. I have two files `app.py` and `shopping_basket.py` in the same folder.

`app.py`:
```python
import shopping_basket

for item in shopping_basket:
  print(f'I need to buy {item}')
```

`shopping_basket.py`:
```python
shopping_basket = ['cookies', 'ice cream']
```

2. I can successfully run `poetry run python src/app.py` on command line to run my app in Poetry's virtual environment. But I get errors when launching the file through VS Code.

3. I have a file (app.py) in the root folder and two files (shopping_basket.py and price_checker.py) in a subfolder called "checkout". 
    - app.py contains `from checkout import shopping_basket`
    - shopping_basket.py contains `import price_checker`
    - When I test the shopping_basket.py file with `python checkout/shopping_basket.py`, there is no error.
    - When I run `python app.py`, I get an error `ModuleNotFoundError: No module named 'price_checker'`. Why?

<details markdown="1"><summary>Click here for answers</summary>

1. The "app" wants to loop over the list declared in shopping_basket.py. Unforunately, the `shopping_basket` object in app.py refers to the whole module, not the list of strings. Either use:
    - Or change the for-loop to `for item in shopping_basket.shopping_basket:`
    -  `from shopping_basket import shopping_basket`

2. The most likely issue is you need to select the correct Python interpreter in VS Code. Find the one created by Poetry in a virtual environment.

3. When you run the file directly, its folder is used as the current working directory. When you run `python app.py`, all imports including inside shopping_basket.py will need to be relative to that top level file, app.py. So its import statement should be `from checkout import price_checker`

> Alternatively, you can explicitly import it relative to the current file, e.g. `from . import price_checker` in shopping_basket.py)

</details>
<br/>

## Summary

And that's the end of Chapter 6. You should now be happy with:
- How to import packages/modules, including different ways of writing the import statement
- What a Python virtual environment is and why it's useful
- The importance of proper package management
- How to use Poetry to manage the virtual environment and required packages

Try an exercise to reinforce what you've learnt on the course so far: [Choose Your Own Adventure](./Exercises/06_adventure_game.md).

The next chapter will be on **classes**.
