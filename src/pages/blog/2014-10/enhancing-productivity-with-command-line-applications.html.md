---
title: Enhancing Productivity with Command Line Applications in Komodo Macros
author: Ethan Gardner
date: 2014-10-11
tags: [macro, productivity, cli]
description: Sample use cases for macros that call third-party scripts and services to boost productivity.
layout: blog
---
Learning a new editor can be a daunting task, and it is a task that I faced in May 2013 when I switched to Komodo (briefly to Edit and then to IDE) after a 7 year history with my previous editor. After becoming familiar with the Komodo interface and keyboard shortcuts, I quickly began looking for other ways to boost my productivity in the application. When I was researching new editors, I remember being impressed with how easy it was to extend the editor’s features using languages like JavaScript and Python which were already in my repertoire, and that was one of the reasons I ended up choosing Komodo.

Komodo IDE does a good job of providing integrated productivity tools such as its publishing feature, integration with source control, and Rx toolkit, but as I became more comfortable with my new editor, I was looking for more. I decided the best way to boost my productivity was to spend more time in the IDE instead of switching between applications in my workflow. At about the same time I began looking for more ways to maximize my time in the IDE, I began seeing posts in my feed reader about “how to do (insert task here) from the command line.” This led to one of the most productivity-boosting mechanisms that I have implemented since switching to Komodo -- using macros to call third-party scripts and services such as the ones I use to manage my day-to-day schedule or deploy code.

## Ticketing System
My employer uses [Jira]( https://www.atlassian.com/software/jira) to manage developer tasks and projects, and I spent a lot of time toggling between Komodo and my browser. Since I already had Python on the path of my development machine, I installed [jira-cli](https://pypi.python.org/pypi/jira-cli). With this switch, I can now look at the tickets that are assigned to me, comment on issues, or create new tickets in Komodo directly. All of the macros I wrote that use jira-cli use interpolation to execute commands, and the output from each command is printed in the bottom pane of Komodo so I never have to leave the IDE.

## Logging Time
The concept of billable hours is likely a familiar concept to any developer that works at for agency or in-house shop. To keep track of my hours, I use a Ruby gem called [Timetrap]( https://github.com/samg/timetrap). Once I look up tickets from Jira, I start a timer to begin recording my time with another interpolation macro inside of Komodo.

```js
// Sample macro to start the Timetrap timer.
// Note: Ruby is on my system path so the shell has
// access to the t command
komodo.assertMacroVersion(3);
if (komodo.view) { komodo.view.setFocus(); }

(function(){
  var command = 't in';
  var task = ko.interpolate.interpolateString(["%(ask:Enter a task:)"]);

  if (task) {
    ko.run.runEncodedCommand(window, 't out', function(){
      task = task.trim();
      if(task.length) {
        command = command + ' ' + task;
      }

      ko.run.runEncodedCommand(window, command);
    });
  }

})();
```

When I’m finished with the ticket, I can then run another macro to stop the timer and see the total amount of time I spent on the ticket so I can record my time in Jira.

```js
// Clock out of the task in timetrap and display the time
komodo.assertMacroVersion(3);
if (komodo.view) { komodo.view.setFocus(); }

(function(){
  var command = 't out';
  ko.run.runEncodedCommand(window, command, function(){
    var command = 't display -v';
    ko.run.runEncodedCommand(window, command);
  });

})();

```

## Deployments
Once my task is complete, I need to get my code committed and deployed. I don’t work in a continuous integration environment, so I need to get the updated files to the correct target environment. Many of the repositories that I work with are hosted with [Beanstalk](http://www.beanstalkapp.com/), which allows developers to initiate deployments in their commit messages. In many cases, deploying to production is as simple as adding `[deploy:production]` to my commit message.

For repositories that are not hosted with Beanstalk, I use a Komodo macro to either SCP the files, which is mostly used when I am working off of a shared development server, or call a custom deployment script that runs `svn up` on the QA and production servers depending on the environment that is the target of the deployment. For those without any of these options, there are other options such as [Capistrano]( http://capistranorb.com/) that can be used to handle deployment and could easily be bound to a Komodo macro.

## Conclusion
Komodo provides an excellent starting point with its tools. When combined with custom macros, it is possible to implement a flexible workflow by leveraging outside tools and maximize the time spent in the editor.
