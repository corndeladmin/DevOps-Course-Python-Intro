---
title: "Chapter 8: Flask and HTML basics"
description: Building a simple web app with Flask and HTML templates
---

# Chapter 8: Flask and HTML basics

## Chapter objectives

TODO: Desc

Python is a very useful tool for helping you write web applications. There are a plethora of useful frameworks and tools that you can use to achieve that and will make your life easier, and this chapter will focus on HTML pages with Flask.

In this chapter you will learn:
- What are the main components of a web applications
- What HTML is and how we can use it
- How we can use Flask to set up a web server
- How we can use Flask to serve HTML pages

## What is a web application?

In short, a web application is a piece of software that is designed to be accessible from the internet through a browser. All sites on the internet are web applications, some of them more complex than the others. You would access them by typing the URL in the browser, and then the browser would display there resource that is found there.

> A URL (Uniform Resource Locator) is a reference to a resource accessible on the internet, and the means of accessing it.

For example, `https://python-intro.devops.corndel.com/08_flask_html_basics.html` is a URL composed of the following:

- A _protocol_: In this case it's `https` (HyperText Transfer Procol Secure), but others exist such as `http`, `ftp`, etc. This establishes some standardised rules of communication between the application and the browser.
- A _hostname_: In this case it's `python-intro.devops.corndel.com`. This refers to the website or application that you're visiting.
- A _resource_ or _file name_: In this case it's `08_flask_html_basics.html`, which refers to the HTML file that's displaying this page.

## What is HTML?

_HTML_ stands for HyperText Markup Language. As its name suggests, HTML is a Markup Language, not a programming language such as python. A Markup Language refers to a system used for encoding text that allows you to insert special characters to structure the text and alter the way it is displayed.

### Exercise 8.1

Let's try to create our first web page. You can do that by creating a new file - the name is not important, but the extension must be `.html`. Within that file, you can just type in `Hello World!` and save.

Now, you can open the file using any browser, and you should see the text `Hello World!`, written in black text on a white background.

## HTML Elements and tags

As we've discussed previously, HTML is a markup language, which means we can alter the way the text is structured and displayed. This is done through the use of `elements` and `tags`.

You can think of a HTML page as a document, which is composed of several elements. Tags are used to mark the beginning and end of an element, and are usually pre-defined keywords enclosed in angle brackets. To denote the start of an element, you would see a tag such as `<tag>`, and to mark where the element ends, the tag also has a forward slash before the keyword, such as `</tag>`.

- `<html>` and `</html>` are tags
- `<html> Hello World! </html>` is an element

> Tags are not displayed by the browser. Instead, they instruct the browser on _how_ to display the HTML element.

### Exercise 8.2

Let's inspect how the browser views our document. You can right click on the page and then pick "Inspect" (this can have a different but similar name depending on your browser, such as "Inspect Element"). This should open up a panel on the right side of the browser. Make sure you navigate to the `Elements` tab, where you will see the `Hello World!` text surrounded by some tags.

We'll discuss what these tags mean shortly, but for now, you can just copy that structure into your html file.

Let's also add `<!DOCTYPE html>` as our first line in the file. This isn't exactly an HTML tag, but it is a declaration that instructs the browser on the type of document that it should expect. All HTML files should start with this DOCTYPE declaration.

<details markdown="1"><summary>You will end up with something like this:</summary>

```html
<!DOCTYPE html>
<html>
	<head></head>
	<body>Hello World!</body>
</html>
```

</details>

> The `<html>` tag should enclose everything that we add to our document, except for the `DOCTYPE` declaration. 

## Building up our page

Now that we have a very simple HTML page, let's add some things to it.

### Exercise 8.3: Adding a page title

If you hover over the tab in your browser, it should display your file name as its title, e.g. `helloworld.html`. Since this isn't particularly pretty, we should change this to something more appropriate. We can do this by adding a `<title>` element.

> You will notice that we have an empty `<head>` element. This is used by browsers to display metadata (data about data) about the page, such as its title (and various other information). You can find more about the Head element [here](https://www.w3schools.com/html/html_head.asp).

Now, pick an appropriate title and add it to our page. Once you save the file, if you refresh the page and hover over the tab in your browser, you should see the title that you have picked.

<details markdown="1"><summary>Click here to reveal the answer</summary>

We will need to add a `<title>My Hello App</title>` element nested under `<head>`. You should end up with something similar to this:

```html
<head>
    <title>My Hello App</title>
</head>
```

</details>

### Adding Text and Headings

> All the following content should be added under the `<body>` element. All contents of a HTML page are aggregated under this element.

Text is one of the most relevant types of content that can be added to a web page. You can add plain text to several HTML elements, which will transform it accordingly.

[Headings](https://www.w3schools.com/html/html_headings.asp) are used to differentiate between different types of texts, offer a logical structuring of the web page, and can be used to provide a common style for your text elements (e.g. fonts, colours, sizes). Essentially, they act as titles and subtitles. They are denoted by `<h1>`, `<h2>`, to `<h6>` tags. By default, the text size is the largest with `h1`, and the smallest with `h6`, but this can be changed.

There's a whole theory behind efficiently using headings for [Search Engine Optimization (SEO)](https://developers.google.com/search/docs/fundamentals/seo-starter-guide), but some rules of thumb are:
- Use `<h1>` for the page's title. You shouldn't have more that 1 or 2 `<h1>` tags, and they should contain keywords relevant for your page
- Use `<h2>` and `<h3>` for subtitles
- Use `<h4>`, `<h5>` and `<h6>` to structure your text

While the above criteria is intentionally a bit vague and there are no hard rules for the three points, they serve as a guideline for making your page more readable.

### Exercise 8.4: Adding some text

Now that you know how to use headings, let's add proper title and subtitle for your page. You should:
- _Add a title_ using an appropriate heading, such as "Hello from my Python app!". Note that this is not the page's title as displayed when you hover over the tab in your browser (i.e. the `<title>` element) - it's just a text that will act as our page's title for our content, a role similar to an article's title.
- _Add a subtitle_ using an appropriate heading, such as "Here is my Python Zoo"

<details markdown="1"><summary>Click here to expand an example</summary>

```html
<body>
    <h1>Hello from my Python app!</h1>
    <h2>Here is my Python Zoo</h2>
</body>
```

</details>


### Images and Links

Images and links are vital for a site's appearance and functionality. We can add an image using the [`<img>`](https://www.w3schools.com/tags/tag_img.asp) tag, and a link using the [`<a>`](https://www.w3schools.com/tags/tag_a.asp) tag.

So far we have used only simple elements and tags, but these 2 are a bit more complex: they do not work properly unless you also add _attributes_ to them.

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

<br>

### Structuring content

Up until this point, we have added each tag one below the other. While this is sufficient for an exercise, in practice you will usually aggregate your content using [`<div>`](https://www.w3schools.com/tags/tag_div.ASP) tags. This has 2 benefits:

- It will logically separate and aggregate content that is related
- It can allow easier styling using a language called CSS - this is beyond the scope of this exercise

Similarly, for text-based content, you could use the paragraph [`<p>`](https://www.w3schools.com/tags/tag_p.asp) tag.

That is all the HTML that we will need for now, but we will come back to it later, to talk about forms, inputs and buttons.

## Web Servers

> Web servers are applications and hardware that are responsible for delivering content available at a certain URL, when a client makes a HTTP request over the internet.

Both the application responsible for delivering content, the hardware on which it runs, or the system as a whole are called "web server". We rarely care enough to explicitly differentiate between them, but in our exercise, "web server" will refer to the application that we write.

Let's think of what happens when you access a site over the internet:

- You navigate to a URL in your browser
- This will generate a HTTP GET request (more on this later!)
- The request will be received by the web server (hardware & software) associated with the domain name (e.g. google.com)
- The web server will check whether the resource that is requested is mapped to a certain route. In this context, a _route_ is the path after the `<hostname>/` on the URL. Looking at the google search example (`https://www.google.com/search?q=alpaca/`), the resource is mapped to the `/search` route.
- If the resource exists, the server responds with a GET Response, which can have many forms. For now, let's say it's an HTML page.
- The browser receives the response and displays it. If it's an HTML page, it will render the HTML.

We have our HTML document, but currently it's only accessible from our filesystem. We want, however, our page to be accessible from the internet, or at least from a browser.

Our next goal is to use an existing web server, make it run locally, and customize it in Python to serve our page if we access its _route_ in the browser.

