---
title: Strlen Considered Dangerous
author: Eric Promislow
date: 2013-10-29
tags: [bug, php]
description: A user complained that when he loaded a particular PHP file into Komodo, the editor would become unresponsive, and there would be no code intelligence. A quick check outside the editor showed most of what I needed to know about this file..
layout: blog
---

A user complained that when he loaded a particular PHP file into Komodo, the editor would become unresponsive, and there would be no code intelligence. A quick check outside the editor showed most of what I needed to know about this file:

```
$ wc bug101267a-long-lines.php
29 184833 735218 bug101267a-long-lines.php
```

The file consisted of the PHP header, a 28-line license, and a single line of code that, as you can see, was about 735K characters long.

We know that Komodo didn't like this kind of code. It turns out it was the output from a parser generator. Not the kind of code you would edit, but it would be useful to get Komodo to provide code completion off it. Unfortunately, we could see that the code-completion module was failing, mainly because the lexer it depended on wasn't finishing.

I used two separate code beautifiers to convert the file to one with lines more suitable for the editor, and got this result:

```
$ wc bug101267c-fixed-lines.php
57430 176622 797240 bug101267c-fixed-lines.php
```

I'm not sure how we lost 10000 lines and about 4600 bytes -- could be due to the first black-box beautifier -- but the problem still stood. A command-line lexer could run through the fixed-line file in about 2 minutes, while I stopped the long-line file due to all the diagnostics I had enabled.

Time to read some more code. The lexer spends a good deal of time evaluating regular expressions using `pcre`. ToddW suggested I benchmark the total time spent with one pass (driven with a command-line tool we use, as it's hard to benchmark interactive editors). The results were telling:

| File  | # calls to pcre_exec | Time |
| :---- | :------------------: | ---: |
| fixed | 6,089,093            | 7.8  |
| long  | 6,172,124            | 1200 |

The call to pcre_exec looked innocent enough:

``` cpp
rc = pcre_exec(p_compiledPattern,
               NULL, // no extra data - we didn't study the pattern
               p_subject,
               (int) strlen(p_subject),
               oldPos - currLineStart,
               PCRE_ANCHORED, /* default options */
               p_MainInfo-&gt;ovector,   /* output vector for substring information */
               p_MainInfo-&gt;ovec_count);/* number of elements in the output vector */
```

I didn't see any obvious looping code in the **pcre** source to `pcre_exec`, and Todd asked about the call to `strlen`. This module deals with one line of input at a time, so we were repeatedly calling `strlen` with a string that contained almost 800,000 characters. Given the number of calls here, we can see that we're running the inner byte comparison of strlen 6,089,093 * 797,240 ~= 4.9%2Be12 times. That's a lot of cycles.

Now `p_subject` comes off a simple string object, which already knows how long the line is, as it uses `new char[]` to allocate enough data. So I replaced the call to `strlen` with a call to a LineLength() wrapper I added to the string object's class. And processing the long-line file took the same amount of time as the reformatted short-line file. It's interesting to note that the short-line file processing time didn't change (significantly) after I optimized out the call to `strlen`. When the average line of code is only 40 characters, calls to `strlen` take a negligible amount of time.

I'm always on the lookout for costly loops in my code. But as this case shows, they don't always have a "for" or "while" in them. In this case, the loop was hiding in a library call I've used without too much concern since I opened my first copy of [K&amp;R][3]. Not to mention that the code is now better suited to handle any embedded null bytes.

   [3]: http://en.wikipedia.org/wiki/The_C_Programming_Language

