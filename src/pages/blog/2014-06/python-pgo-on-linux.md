---
title: Python - 10% performance improvement by using Profile Guided Optimization (PGO)
author: Todd Whiteman
date: 2014-06-25
tags: [python, pgo, performance, optmization]
description: I've been examing the benefits of using Profile Guided Optimization for building Python - with some success.

layout: blog
---

## Summary

By using GCC PGO when building Python, I've managed to achieve a healthy 10%
speedup for CPU bound Python programs.

## About PGO

PGO works by compiling the program (in my case Python) with special flags,
running that program on a benchmark test suite and then re-compiling, which will
take into account the past performance runs to better optimize the resulting
program.

## The Specs

First up - here's what I am using:
 * Python 2.7.7
 * GCC 4.8.2
 * Ubuntu 14.04 (64 bit)
 * Intel Q6600 @ 2.40GHz CPU

Benchmarking programs used:
 * pybench (part of Python source tree)
 * pyDes (encryption algorithm in pure Python)

## Compilation steps

This is method I've used to build Python on Linux using GCC and PGO:

```
# unpack it
wget https://www.python.org/ftp/python/2.7.7/Python-2.7.7.tgz
tar xf Python-2.7.7.tgz
cd Python-2.7.7

# build it with PGO generation
export CFLAGS="-fprofile-generate"
export CXXFLAGS="-fprofile-generate"
export LDFLAGS="-fprofile-generate"
configure
make

# run profile script
make run_profile_task  # I had to tweak the makefile to add LD_LIBRARY_PATH

# build it again with PGO collection
make clean
export CFLAGS="-fprofile-use -fprofile-correction"
export CXXFLAGS="-fprofile-use -fprofile-correction"
export LDFLAGS="-fprofile-use -fprofile-correction"
make

# profit!
make install
```

## Results

Here the results of PGO v's non PGO builds:

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Program',  'Without PGO', 'With PGO'],
      ['pybench',   4285,          3792],
      ['pydes',     5219,          4733],
    ]);

    var options = {
      title: 'Performance'
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>

and the raw chart data:

----------------------------------------------------------
Script       | Without PGO   | With PGO     | Increase   |
----------------------------------------------------------
pybench      |   4285ms      |   3792ms     |    13%     |
----------------------------------------------------------
pyDes        |   5219ms      |   4733ms     |    10%    |
----------------------------------------------------------

