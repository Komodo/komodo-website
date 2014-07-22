---
title: PHP 5.6 and forwards
author: Todd Whiteman
date: 2014-07-23
tags: [php, php56, phpng, performance]
description: PHP - taking a look at future PHP releases to see what's coming in the future.
layout: blog
---

<img src="/images/blog/2014-07/php-med-trans.png" align="right"/>

PHP is still under active development and there are some very interesting
changes and features that are coming to the language.

## PHP 5.6

PHP 5.6 is currently in RC (release candidate) status, which means it will be
officially released soon (I suspect in the next few months).

Here's a highlight of the new features:

* [Constant scalar expressions](http://php.net/manual/en/migration56.new-features.php#migration56.new-features.const-scalar-exprs)
* [Variadic functions](http://php.net/manual/en/migration56.new-features.php#migration56.new-features.variadics)
* [Argument unpacking](http://php.net/manual/en/migration56.new-features.php#migration56.new-features.splat)
* [Namespace use function and use const](http://php.net/manual/en/migration56.new-features.php#migration56.new-features.const-scalar-exprs)
* [Exponential syntax](http://php.net/manual/en/migration56.new-features.php#migration56.new-features.use)

We've been making changes to Komodo 9 to support PHP 5.6, for code highlighting,
code intelligence and debugging components. You can get the [Komodo
9 pre-release](/download/#preview) build from our downloads page.

## PHPNG

A development branch currently being referred to as PHP Next Generation (PHPNG)
is looking very promising. It's mostly a refactoring of the PHP (Zend Engine)
internals, with the aim to increase PHP performance.

So far, performance has been improved by 100% in real world applications, whilst
still maintaining API compatibility - that's totally awesome, and generally
unheard of in the dynamic languages arena, especially for such a mature language
like PHP. All in all, amazing improvements and I cannot wait to see the final
release containing this work!

This is purely speculation, but I think these PHPNG changes may eventually
become the center piece for a PHP 6.0 version (maybe next year).

You can read more about the changes going on in PHPNG here:
http://ckon.wordpress.com/2014/07/14/php-5-7-twice-as-fast/

## PHP 5.3

It's also worth looking back at older versions too, as PHP 5.3 is already
end-of-lifed, with official support ending July 2014 (this month), so no more
security fixes can be expected for PHP 5.3.
