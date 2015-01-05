---
title: Logging Time in Komodo with WakaTime
author: Nathan Rijksen
date: 2015-01-05 6:00
tags: [time tracking, productivity, addons]
description: A while ago a new Komodo addon was submitted that seeks to make time tracking easier simply by using your editor activity as a means of tracking your time, allowing you to just do what you normally do without having to worry about manually starting or stopping some meter.
layout: blog
---

<img src="/images/blog/2015-01/wakatime.png" align="right">

I'm sure many of our users use time tracking software on a daily basis, using all
sorts of tools to get the job done. I myself am no stranger to the likes of Harvest,
Freshbooks, and have usually used those tools in combination with some systray
app that lets me quickly track time. For me the problem has always been that I
tend to forget to start and stop my timers, I am way too ADD to be train myself
to do this consistently.

A while ago a new Komodo addon was submitted that seeks to address issues like
this simply by using your editor activity as a means of tracking your time,
allowing you to just do what you normally do without having to worry about
manually starting or stopping some meter.

<img src="/images/blog/2015-01/wakatime-screenshot.png" align="right">

It hooks into [Komodo's Project functionality][1] to identify what you are working on,
automatically grouping your hours into the appropriate Project. So if you tend
to jump between many client projects during the day and are already using Komodo
Projects (if not - you should!) then this will all work right out of the box for you!

Installation is simple, just download the addon from our Resources section and
drag it onto Komodo. Sign up on [WakaTime.com] and copy your API key from the settings page.  On restarting Komodo, input the key when prompted and you are good to go!  Note it
may take a couple of minutes before data appears on [WakaTime.com] for the first
time but after that it should update real-time. The default time out value is 15
minutes but you can change that in settings.

So a big thanks to WakaTime to filling this void, having time tracking built right
into Komodo is a big bonus which I'm sure many of you will like!

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/addons/wakatime--wakatime/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-addon" target="_blank">Install Instructions</a>
    </span>
</div>

   [1]: /screencasts/watch/87287634-projects-and-what-theyre-for/
   [WakaTime.com]: http://wakatime.com