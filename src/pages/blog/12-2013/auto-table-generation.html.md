---
title: Auto-table Generation with Snippets, EJS and Komodo
author: Carey Hoffman
date: 2013-12-3
tags: [macro, EJS, HTML tables]
description: I hate laying out tedious HTML tables. I know you do too. In fact, I'm sure you have a better way of doing it then typing it out tag for closing tag. This post is to show you how you can easily write a snippet in Komodo that does that for you.
layout: blog
---

I hate laying out tedious HTML tables. I know you do too. In fact, I'm sure you have a better way of doing it then typing it out tag for closing tag. This post is to show you how you can easily write a snippet in Komodo that does that for you.

By using EJS in our snippets which was [implemented by EricP in Komodo 8](/blog/2012/12/saving-keystrokes-macro-snippets) you can now perform processing tasks within your [snippets](http://docs.activestate.com/komodo/8.5/snippets.html#snippets_top) as well as the [existing interpolation ](http://docs.activestate.com/komodo/8.5/komodo-js-api.html#ko.interpolate)in snippets and other features.

Here's the code for the HTML table generating snippet I promised:

``` javascript
<%
var cols = parseInt(ko.interpolate.interpolateString(["%(ask: How many columns?)"]));
var rows = parseInt(ko.interpolate.interpolateString(["%(ask: How many rows?)"]));
if (cols <= 0 || rows <= 0){
    alert("I don't know how to make a table with \"" + cols + "\"" +
          "\n or \"" + rows + "\".  How about you try that again.");
} else {
    c = 0;
    r = 0;
    var filler = "<!-- Fill me IN -->";
    var table = "<table>\n";
    while(c < cols) {
        r=0;
        table += "\t<tr>\n";
        while (r < rows) {
            table += "\t\t<td>" + filler + "</td>\n";
            r++;
        }
        table += "\t</tr>\n";
        c++;
    }
    table += "</table>";
}
%><%= table? Table : "" %>
```

As you can see, in the first control EJS block, &lt;% %&gt;, I query for dimensions of the table from the user with ko.interpolate and perform some simple processing with the numbers to concatenate a table together with the correct dimensions. I also parseInt() the inputs so I can do a simple number &gt; 0 check to see that I have appropriate inputs.

Then I simply dump the string to the editor buffer using an emitter block, &lt;%=&nbsp; %&gt;.

1. To try this snippet out, here are quick instructions on how to create the snippet so it works in your HTML documents:
2. In Komodo, menu View &gt; Tabs &amp; Sidebars &gt; Toolbox.
3. In Toolbox, Sample (x.y.z) &gt; Abbreviations: right click &nbsp;"HTML-common" &gt; Add &gt; Snippet. \*
4. Name the snippet something short (I used tb, "table generator")
5. Enter the code from above in the code text field
6. Select the Auto-Abbreviation and Treat As EJS options then click ok.
7. Open a new HTML template: CTRL + shift + N (mac is Ctrl + cmd + n) &gt; select html from Templates &gt; click Open
8. Type "tb" then space

The snippet should trigger at this point. You can fill in the field and generate a table now (Fist pump). Now some of you might have just read this and thought “Carey...the emmet plugin works in Komodo as well. And it totally blows this script out of the water.” And to you I say “I already wrote the snippet and part of the post by the time I found that out”, so here we are. You could modify this snippet easily to create unorder lists and many other repetitive formatting tasks in HTML. Now go play!

\* *If you're going to create your own snippets you must pull the Abbreviations folder out of the Sample (x.y.z) folder and place it in the root of your toolbox or else they will be moved aside on your next upgrade.*

**References:**

The Komodo Extension Developer toolkit -[http://community.activestate.com/node/1824](http://community.activestate.com/node/1824) (I use the javascript shell in that kit constantly)

Komodo Javascript API - [http://docs.activestate.com/komodo/8.5/komodo-js-api.html](http://docs.activestate.com/komodo/8.5/komodo-js-api.html)

Komodo Macro API - [http://docs.activestate.com/komodo/8.5/macroapi.html](http://docs.activestate.com/komodo/8.5/macroapi.html)

Komodo IRC channel: [irc://irc.mozilla.org/#komodo](irc://irc.mozilla.org/#komodo)

