---
title: "Chapter 8: Flask and HTML basics"
description: Building a simple web app with Flask and HTML templates
---

# Chapter 8: Flask and HTML basics

## Chapter objectives

Python is a very useful tool for helping you write web applications, because you can achieve powerful objectives with very few lines of code. There are a plethora of useful frameworks and tools that you can use, but this chapter will focus on HTML pages with Flask.

In this chapter you will learn:
- What are the main components of a simple web application,
- What HTML is and how you can use it,
- How you can use Flask to set up a simple web server,
- How you can use Flask to serve HTML pages,
- How you can handle basic forms and inputs

## What is a web application?

In short, a web application is a piece of software that is designed to be accessible from the internet through a browser. All sites on the internet can be considered web applications, some of them more complex than the others. You would access them by typing in a URL in the browser, and then then you would see the resource that is found at that location.

> A URL (Uniform Resource Locator) is a reference to a resource accessible on the internet, and the means of accessing it.

For example, `https://python-intro.devops.corndel.com/08_flask_html_basics.html` is a URL composed of the following:

- A _protocol_: In this case it's `https` (HyperText Transfer Procol Secure), but others exist such as `http`, `ftp`, etc. This establishes some standardised rules of communication between the application and the browser.
- A _hostname_: In this case it's `python-intro.devops.corndel.com`. This refers to the domain name of the website or application that you're visiting.
- A _resource_ or _file name_: In this case it's `08_flask_html_basics.html`, which refers to the HTML file used to display this page.

## What is HTML?

_HTML_ stands for HyperText Markup Language. As its name suggests, HTML is a Markup Language, not a programming language such as python. A Markup Language refers to a system used for encoding text, which allows inserting special characters to structure the text and alter the way it is displayed.

### Exercise 8.1

Let's try to create a simple web page. You can do that by creating a new file - the name is not important, but the extension must be `.html`. Within that file, you can just type in `Hello World!` and save.

Now, if you open the file using any browser, you should see the text `Hello World!` written in black text on a white background.

## HTML Elements and tags

Since HTML is a markup language, it is possible to alter the way the text is structured and displayed. This is done through the use of `elements` and `tags`.

You can think of an HTML page as a document, which is composed of several elements. Tags are used to mark the beginning and end of an element, and are usually pre-defined keywords enclosed in angle brackets. To denote the start of an element, you would see a tag such as `<tag>`, and to mark where the element ends, the tag is accompanied by a forward slash before the keyword, such as `</tag>`.

> Many elements allow other elements nested inside them, called _child nodes_. Child nodes refer to those above them as _parent nodes_.

> Tags are not displayed by the browser. Instead, they instruct the browser on _how_ to display the HTML element.

There are also elements that do not have an end tag and cannot contain child (nested) nodes. These are called [void elements](https://developer.mozilla.org/en-US/docs/Glossary/Void_element), and among those we will use `<input>` and `<img>`.

As an example:
- `<html>` and `</html>` are tags
- `<html> Hello World! </html>` is an element
- `<input>` is also an element

### Exercise 8.2

Let's inspect how the browser views our document. Right click anywhere on the page and then pick "Inspect" (this can have a different but similar name depending on your browser, such as "Inspect Element" or "Inspector"). This should open up a panel on the right side. Navigate to the `Elements` tab, where you will see the `Hello World!` text surrounded by some tags.

We'll discuss what these tags mean shortly, but for now, you can just copy that structure into your html file.

Let's also add `<!DOCTYPE html>` as the first line in the file. This isn't exactly an HTML tag, it is a declaration that instructs the browser on the type of document that it should expect. All HTML files should start with this DOCTYPE declaration.

You will end up with something like this:

```html
<!DOCTYPE html>
<html>
	<head></head>
	<body>Hello World!</body>
</html>
```

> The `<html>` tag should enclose everything in the document, except for the `DOCTYPE` declaration.

> HTML is _not_ whitespace sensitive. You can use whitespaces to format HTML to make it more readable.

## Building up the page

Now that you have a very simple HTML page, let's add some things to it.

### Exercise 8.3: Adding a page title

If you hover over the tab in your browser, it should display your file name as its title, e.g. `helloworld.html`. Since this defaults to the file name, you should change it to something more appropriate. You can do this by adding a `<title>` element.

> You will notice an empty `<head>` element. This is used by browsers to display metadata (data about data) about the page, such as its title and various other information. You can find more about the Head element [here](https://www.w3schools.com/html/html_head.asp).

Now, pick an appropriate title and add it to the page. Once you save the file, if you refresh the page and hover over the tab in your browser, you should see the updated title.

<details markdown="1"><summary>Click here to reveal the answer</summary>

You will need to add a `<title>My Hello App</title>` element nested under `<head>`. You should end up with something similar to this:

```html
<head>
    <title>My Hello App</title>
</head>
```

</details>

### Adding Text and Headings

> The [`<body>`](https://www.w3schools.com/tags/tag_body.asp) element contains all the contents of an HTML document, and is a direct child of `<html>`. 

Currently, your `<body>` element contains only simple text, but all the content that you add to your page (e.g. images, paragraphs, links) should be added under this element.

Text is one of the most relevant types of content that can be added to a web page. You can add plain text to several HTML elements, which will transform it accordingly.

[Headings](https://www.w3schools.com/html/html_headings.asp) are used to differentiate between different types of texts, offer a logical structuring of the web page, and can be used to provide a common style for your text elements (e.g. fonts, colours, sizes). Essentially, they act as titles and subtitles. They are denoted by `<h1>`, `<h2>`, ... up to `<h6>` tags. By default, the text size is the largest with `h1`, and the smallest with `h6`, but this can be changed.

There's a whole theory behind efficiently using headings for [Search Engine Optimization (SEO)](https://developers.google.com/search/docs/fundamentals/seo-starter-guide), but some rules of thumb are:
- Use `<h1>` for the page's title. You shouldn't have more that 1 or 2 `<h1>` tags, and they should contain keywords relevant for your page
- Use `<h2>` and `<h3>` for subtitles
- Use `<h4>`, `<h5>` and `<h6>` to structure your text

While the above criteria is intentionally a bit vague and there are no hard rules for the three points, they serve as a guideline for making your page more readable.

### Exercise 8.4: Adding some text

Add proper title and subtitle for your page. You should:
- _Add a title_ such as "Hello from my Python app!", using an appropriate heading. Note that this is not the page's title as displayed when you hover over the tab in your browser (i.e. the `<title>` element) - it's just a text that will act as the page's title for your content, a role similar to an article's title.
- _Add a subtitle_ such as "Here is my Python Zoo", using an appropriate heading

<details markdown="1"><summary>Click here to expand an example</summary>

```html
<body>
    <h1>Hello from my Python app!</h1>
    <h2>Here is my Python Zoo</h2>
</body>
```

</details>


### Images and Links

Images and links are vital for a site's appearance and functionality. You can add an image using the [`<img>`](https://www.w3schools.com/tags/tag_img.asp) tag, and a link using the [`<a>`](https://www.w3schools.com/tags/tag_a.asp) tag.

So far the elements and tags were fairly simple, but these 2 are a bit more complex: they do not work properly unless you also add _attributes_ to them.

> HTML attributes act similar to variables, and are used by elements in order to enable certain functionality. They are key/value pairs added to the start tag of an element, with the value being enclosed in quotes. 

Each element has a list of attributes that it supports, and each attribute can accept a certain type of value, such as strings, numbers, or pre-defined keywords.

### Exercise 8.5: Adding an image and a link

Check out the links above for the `<img>` and `<a>` tag, more specifically the "Example" and "Definition and Usage" sections. Then:

- Add an image of an animal to the directory where your html file is.
- Link the image in your HTML document, after your subtitle. Don't forget the `alt` attribute!
- Add a link to your page, after the image. Let's add a link to a google search for an alpaca (you can copy [this link](https://www.google.com/search?q=alpaca)). The text that links to the google search should read "Click here to search for an Alpaca"
- Refresh the page and check that everything works as expected

<details markdown="1"><summary>Click here to expand an example</summary>

```html
<img src="alpaca.png" alt="A lovely alpaca image!" />
<a href="https://www.google.com/search?q=alpaca/">Click here to search for an Alpaca</a>
```
</details>

[Stretch goal] Depending on the image you have chosen, it can be a bit too large for your page. Add attributes to the `<img>` element to resize it to 300 pixels (px) in width and height. You can check the link above for the attributes that you will need to use.

<details markdown="1"><summary>Click here to view the solution</summary>

```html
<img src="alpaca.png" alt="A lovely alpaca image!" width="300px" height="300px"/>
```
</details>


### Lists

Lists are useful to structure related information. In HTML, there are 2 relevant tags for this: unordered lists (`<ul>`) and ordered lists (`<ol>`). These contain several list items ([`<li>`](https://www.w3schools.com/tags/tag_li.asp)), which are the actual items in the list.

By default, unordered lists will appear with a symbol, such as bullet point, and ordered lists will appear with a number or letter. This can, of course, be changed to any symbol (or even image!).

### Exercise 8.6: Adding a list

Below your image and link, add a list (ordered or unordered, up to your preference), of three animals.

<details markdown="1"><summary>Click here to view an example</summary>

```html
<ul>
    <li>Octopus</li>
    <li>Lion</li>
    <li>Giraffe</li>
</ul>
```
</details>

### Structuring content

So far, you have added each tag one below the other. While this is sufficient for an exercise, in practice you will usually aggregate your content using [`<div>`](https://www.w3schools.com/tags/tag_div.ASP) tags. This has 2 benefits:

- It will logically separate and aggregate content that is related
- It can allow easier styling using a language like CSS - this is beyond the scope of this exercise

Similarly, for text-based content, you could use the paragraph [`<p>`](https://www.w3schools.com/tags/tag_p.asp) tag.

That is all the HTML that we will need for now, but we will come back to it later, to talk about forms, inputs and buttons.

## Web Servers

> Web servers are applications and hardware that are responsible for delivering content available at a certain URL, when a client makes a HTTP request over the internet.

Both the application responsible for delivering content, the hardware on which it runs, or the system as a whole are called "web server". It's usually not important to explicitly differentiate between them, but in this exercise, "web server" will refer to the application that you write.

Let's think of what happens when you access a site over the internet:

- You navigate to a URL in your browser
- This will generate a HTTP GET request (more on this later!)
- The request will be received by the web server (hardware & software) associated with the domain name (e.g. google.com)
- The web server will check whether the resource that is requested is mapped to a certain route. In this context, a _route_ is the path after the `<hostname>/` on the URL. Looking at the google search example (`https://www.google.com/search?q=alpaca/`), the resource is mapped to the `/search` route.
- If the resource exists, the server responds with a GET Response, which can have many forms. For now, let's say it's an HTML page.
- The browser receives the response and displays it. If it's an HTML page, it will render the HTML.

The current HTML document is only accessible from your filesystem. Ideally, however, the page to be accessible from the internet, or at least from your machine at a specific URL.

The next goal is to use an existing web server, make it run locally, and customize it in Python to serve your page when accessing its URL in the browser.

## Flask

You can use the [Flask](https://flask.palletsprojects.com/en/2.2.x/) framework to help with the goals above.

Flask is a framework that provides a built-in web server, as well as a library that allows you to create a web application.

Let's create a new folder called `zoo_app` and open it in VS Code.

### Exercise 8.7: Adding dependencies

As in previous exercises, you will use `poetry` to manage python packages
- Run the command to initialize poetry, `poetry init`. You can use default settings
- In order to use a virtual environment local to your project, you will need to create a new file called `poetry.toml` in the root of your project, and add the following two lines to it:
```python
[virtualenvs]
create = true
in-project = true
```
- Run the command to add `flask` to the list of dependencies

### Minimal flask application

Let's start by creating an `app.py` file (it's important to use this name!), and paste the following:

```python
import flask

app = flask.Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"
```

- The first line imports the `flask` module
- Then, it call the Flask constructor with the parameter `__name__` to obtain an instance of a flask app. `__name__` is a special variable in python that refers to the current module.
- Then, it adds a _route_ in the app, available at the `/` path. This means that, when you access the application on `/`, the `hello_world()` function will be executed.

> The function name can be chosen freely since your application's users will not see it, and there isn't a convention that needs to be followed as long as it's a valid python name. However, in practice, it's useful to choose a brief name that describes what the function does.

Let's try running the app. In a terminal, type `poetry run flask --debug run`.

> The `--debug` flag is used by Flask to enable hot reloading, meaning the server will restart when you make a change to your code. This allows you to make changes to your code and have them visible without having to manually restart the flask server. 

You should see in the terminal a message similar to:

```
Running on http://127.0.0.1:5000
```

If you visit this in a browser, or `http://localhost:5000`, you should see "Hello World!".

### Using your previous HTML file

Since you have already written an HTML file, it would be nice to serve that instead of a hardcoded HTML string.

You will need to:
- Create a new folder called `templates` in your project root, and place the HTML file there
- Create a new folder called `static` in your project root, and place the animal image there

> These folder names are important! Flask will look, by default, in a "templates" folder for HTML files or templates, and in a "static" folder for static files. While this behaviour can be changed, for now it will be sufficient.

Your file structure should look like this:
```
- app.py
- templates/
    - helloworld.html
- static/
    - alpaca.png
- poetry files

```

### Exercise 8.8: Serving the template

Even though you have placed everything in the relevant folders, you haven't yet changed the `hello_world()` function, so you will still get "Hello World!" when visiting the site.

You will need that function to return, instead, the return value of `flask.render_template` or `flask.templating.render_template`. If you're not sure what parameters to use when calling these functions, try to `Ctrl + Left Click` on the function in VS Code and see if the flask documentation helps.

If you refresh the page in your browser and everything is working correctly, you should see a page similar to what you built previously, but with the image not loading.

<details markdown="1"><summary>Click here to view the solution</summary>

```python
import flask

app = flask.Flask(__name__)

@app.route("/")
def hello_world():
    return flask.templating.render_template("helloworld.html")
```
</details>



### Exercise 8.9

The image is not loading and, instead, you are greeted by the alt text that you have added to the `<img>` tag. That's because the path you have used for the `src` attribute in the HTML file is no longer accurate.

Consider your current folder structure and the fact that you're running the code from the root of your project (where the _app.py_ file is). What is the new path, from the project's root to the image file?

Change the _src_ path accordingly, refresh the page, and confirm that the image is loading.

<details markdown="1"><summary>Click here to view the solution</summary>

Both `./static/alpaca.png` and `static/alpaca.png` should work.

</details>

## Flask Templates and Refactoring

Your app can now serve static pages, but if you need to deal with dynamic content such as inputs and forms, this is not enough. Let's explore how to change the animal list that is currently hardcoded into the HTML file to make it dynamic.

Flask has can use a powerful mechanism called _templating_. In this context, a template is an HTML file in which you can embed variables, expressions, conditionals, loops or others.

> The idea of templating is available in many programming languages and tech stacks. While the name can vary, the main concepts are very similar.

The templating language that Flask uses is based on Jinja, which allows intertwining code with HTML. You can find more information about it [here](https://jinja.palletsprojects.com/en/3.1.x/templates/).

Jinja has a few specific delimiters:
- `{% ... %}` is used for Statements (e.g. for loops, if cases)
    - Statements are usually followed by another `{% end<statement> %}` (e.g. `{% endfor %}`), to mark where the statement's block ends
- `{{ ... }}` is used for Expressions or variables

### Exercise 8.10

Create a list (you could call it "animals") of three animal names in `app.py`. This list should live as long as the server is running, so where should you place it? What data type should you use to store the animal names?

<details markdown="1"><summary>Click here to view the solution</summary>

The list should be placed at the top level of `app.py`, outside the `hello_world` function. If the list is a local variable for the function, then it would be destroyed when the function finishes running, so the list would not be persistent.

You can use strings for animal names, and the assignment should look similar to:

```python
animals = ['Octopus', 'Lion', 'Giraffe']
```

</details>


### Exercise 8.11

Check out Jinja's minimal template example [here](https://jinja.palletsprojects.com/en/3.1.x/templates/). Make the necessary changes to your HTML file, such that your static list of animals is now being replaced by the animals list in _app.py_.

You will need to change the way you call `render_template`, so that the template has access to the variable in _app.py_. For instance, writing:

```python
render_template("helloworld.html", animals_in_template=animals_in_app_py)
```

Will allow you to access the variable named `animals_in_template` in the Jinja template, with the value `animals_in_app_py`. You can also pick the same name for these 2 variables, such as simply `animals`.

<details markdown="1"><summary>Click here to view the solution</summary>

You will need to use a for loop, to iterate through the animal list and display it within a `<li>`:

```html
<ul>
    {% for animal in animals %}
        <li>{{ animal }}</li>
    {% endfor %}
</ul>
```

</details>

## CRUD, HTTP Methods, inputs and forms

_CRUD_ stands for Create, Read, Update, Delete, which are the four basic operations that a web application would perform.

Thinking of your application so far, you have only implemented the ability to Read information upon visiting the `/` path. Sometimes this is enough for simple websites that deliver static content. For more interactive user experiences, however, you will likely need to implement other operations.

_HTTP_ (HyperText Transfer Protocol) stands at the foundation of data communication over the internet, as it standardises the way documents are served to clients. It is a  request-response protocol based on client-server communication. A typical client could be a browser, which then communicates with servers that deliver HTML files or other media resources.

HTTP defines several operations through which the client communicates with the server. Four of the most common ones are:
- `GET`: Is used to request information from the client. It is similar to a Read operation of CRUD, and is intended to have no side effects on the server side.
- `POST`: Is used to request the server to perform a certain operation that will possibly modify its resources, such as uploading a message, creating an object in a database, asking to send an email, etc.
- `PUT`/`PATCH`: Used for updating resources.
- `DELETE`: Used for deleting resources.

> While the standard dictates that HTTP methods behave in a certain expected way, the server's code ultimately decides what its methods do. Even so, adhering to these conventions is most of the times desiarable.

This is just a very brief introduction to HTTP and CRUD. These topics will be discused in more detail in further modules.

### Exercise 8.12

Although you haven't explicitly mentioned it in the code, while communicating with the `/` route of your application through the browser, one of the HTTP methods has to be used. Which of the above is most likely to be used?

<details markdown="1"><summary>Hint</summary>
While the Flask application is running, you can refresh the page and check the terminal in VS Code. The method used, along with the path requested, should appear in the log.
</details>

After you've figured out the HTTP method, try setting it explicitly in the code. You can do that by adding a `methods` parameter to the app routing, like this:

```python
@app.route("/", methods=['HTTP_METHOD'])
```

Refresh the page to check that everything is still working.

### HTTP Response Codes

Since HTTP is a request-response protocol, the server needs to communicate to the client the status of the request (e.g. whether it was successful or not), in order for the client to interpret the server's response correctly.

HTTP uses response codes to communicate this. They are composed of three digits, 1xx-5xx, where the first digit signifies the class of responses:
- 1xx informational response - the request was received by the server
- 2xx successful - the request was processed successfully
- 3xx redirect - the client is redirected to another resource or path
- 4xx client error - the client's request is invalid
- 5xx server error - there is an error with the server, when responding to an apparently correct request

### Exercise 8.13

Refresh the page and check out Flask's output in the VS Code terminal.

- What status code is displayed for the `/` endpoint?
- What status code is displayed for the image?
- Why is the image status code different from the page's? You can check out [here](https://www.rfc-editor.org/rfc/rfc9110.html#name-overview-of-status-codes) an explanation for the status code that you should be seeing.

Try changing the HTTP operation in your code and refresh the page. What status code are you seeing now and why?

<details markdown="1"><summary>Click here to reveal the answers</summary>

- The status code for the `/` route should be `200` (OK), signifying that the request completed successfully
- The status code for the image should be `200` for the first request, but upon refreshing the page it should be `304` (Not Modified). The client already has a copy of the image, so the server instructs the client to use the local copy instead of downloading a new one.
- If you change the HTTP method in your endpoint to anything else but `GET`, you should receive a `405` (Method not allowed) response when refreshing the page.

</details>


### Exercise 8.14

You will need to add a new endpoint to your application, mapping a route called `/add`. This will be responsible for adding an animal name to the existing list. The method should have a single parameter, which you can assume to be a string.

Consider the following questions:
- Which HTTP method should you use for this endpoint? The requests will be made with the purpose of adding data to a "database"
- What status code/action should the function return after adding the animal to the list? If the request is successful, the user should see the (updated) page on `/`

Once you've come up with your answers, double-check with the answers below:

<details markdown="1"><summary>Click here to reveal the answers</summary>

- While we could use any HTTP operation, `POST` is the most appropriate one considering the conventions
- Here are two ways of solving the problem:
    - Return the same filled-in template after adding the animal to the list, so the response code should be `200`. However, you will notice that, after calling this endpoint, the URL will remain `/add` instead of `/`. This can be problematic, because when refreshing the page, the form could be resubmitted, resulting in additional POST requests with unintended consequences!
    - Return a redirect to the `/` endpoint, so the response code would be one of `3xx`. This will instruct the browser to make a request to the URL for `/`.

If you have a different solution for the second point, feel free to use it as long as it fits the requirements.

</details>

Now you should have everything you need to write the endpoint.

<details markdown="1"><summary>Click here to reveal a model implementation</summary>

```python
@app.route('/add', methods=['POST'])
def add_animal(animal):
    animals.append(animal)
    return flask.redirect('/')
```

</details>

### Forms and input

The new endpoint is currently available in your app, but users cannot interact with it directly. They would, presumably, need to use a 3rd party application to make the requests.

One way of sending a POST request to the app is to add a text input field within a form. Users could fill in the blank space, press the "Send" button, and trigger a request.

### Exercise 8.15: Adding a text input and a button

Before or after the list, add a new `<input>` element of type text. You can see the documentation for that element [here](https://www.w3schools.com/tags/tag_input.asp).

> While it is good practice to also add a `<label>` to input elements, you can skip that for now

> You must add the `name` attribute to the input element, and the name must match the value that you used in your endpoint as a parameter.

Add a button element below the input element. You can see the documentation [here](https://www.w3schools.com/tags/tag_button.asp). The button's type will indicate what the button is supposed to do, so you can go with the type `submit`. This will submit the form that you will add soon, without the need for additional attributes for the button.

Check that when you refresh the page, there's a new text input with a button near it. Currently they're not supposed to do anything.

<details markdown="1"><summary>Click here to reveal the solution</summary>

```html
<input type="text" name="animal">
<button type="submit">Send</button>
```

</details>

### Exercise 8.16: Adding a form

Add a new form element that will contain the input and button. You can check out the documentation [here](https://www.w3schools.com/tags/tag_form.asp).

What should be the values for the `action` and `method` attributes?

<details markdown="1"><summary>Click here to reveal the solution</summary>

```html
<form action="/add" method="post">
    <input type="text" name="animal">
    <button type="submit">Send</button>
</form>
```

</details>

There is one more thing before testing if everything works. You will need to obtain the value of the form's field in a different way, not as a parameter to the function. So, you should:
- Remove the function's parameter
- Obtain the form's field from `flask.request.form`. This is a dictionary containing key-value pairs of your form's fields, where the keys correspond to the input's `name` attribute. So, if your input has the name "animal", you could obtain the value from `flask.request.form['animal']`

### Test whether everything works

Your application should:

- Return a page containing a list of animals when accessing the `/` route
- Contain a form, with a text input and a submit button
- Upon submitting the form, the page is refreshed and the list of animals is updated.

<details markdown="1"><summary>For reference, here is a sample solution:</summary>

helloworld.html:
```html
<!DOCTYPE html>
<html>
	
	<head>
		<title>My Hello App</title>
	</head>
	<body>
		<h1>Hello from my Python app!</h1>
		<h2>Here is my Python Zoo</h2>
		<img src="./static/alpaca.png" alt="A lovely alpaca image!" width="300px" height="300px"/>
		<a href="https://www.google.com/search?q=alpaca/">Click here to search for an Alpaca</a>
		<ul>
			{% for animal in animals %}
				<li>{{ animal }}</li>
			{% endfor %}
		</ul>

		<form action="/add" method="post">
			<input type="text" name="animal">
			<button type="submit">Send</button>
		</form>
	</body>
</html>
```

app.py file:

```python

import flask

app = flask.Flask(__name__)

animals = ['Octopus', 'Lion', 'Giraffe']

@app.route("/", methods=['GET'])
def hello_world():
    return flask.templating.render_template("helloworld.html", animals=animals)

@app.route('/add', methods=['POST'])
def add_animal():
    animal = flask.request.form["animal"]
    animals.append(animal)
    return flask.redirect('/')

```

</details>

