[![Build Status](https://travis-ci.org/raniemi/elixir_examples.svg?branch=master)](https://travis-ci.org/raniemi/elixir_examples)
[![Coverage Status](https://coveralls.io/repos/raniemi/elixir_examples/badge.svg?branch=master&service=github)](https://coveralls.io/github/raniemi/elixir_examples?branch=master)

Elixir Examples
===============

This git repository is used (by me) to document things I have learned about the [Elixir](http://elixir-lang.org/) language and to test out new tools that support it.

### Prerequisites

If you want to use this repository then you'll need to either [install](http://elixir-lang.org/install.html) [Elixir](http://elixir-lang.org/) first or use the [Docker Toolbox](https://www.docker.com/docker-toolbox).  The benefits of the latter is that it will be easier for you to bump up/down versions of [Elixir](http://elixir-lang.org/) (and it's dependencies) without polluting your host.

### Background

This [Elixir](http://elixir-lang.org/) project was originally created using [mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html):
```console
mix new elixir_examples --module ElixirExamples
```

### Usage

To use this repository:
```console
git clone https://github.com/raniemi/elixir_examples.git
cd elixir_examples
```

If you already have Elixir, mix, etc. installed on your host then you could forgo [Docker](https://www.docker.com/) all together and invoke the mix commands directly as follows:
```console
mix do deps.get, compile
```

If you decide to use [Docker](https://www.docker.com/) then you will need to build the docker image as follows:

```console
docker build -t raniemi/elixir_examples .
```

Or alternatively:

```console
./bin/docker-build
```

Following on the earlier mix example, all you have to do to use the tools installed on [Docker](https://www.docker.com/) is to prefix the same command with `./bin/docker-run`.  For example:
```console
./bin/docker-run mix do deps.get, compile
```

### Helpful Commands

As I started working with this project and docker, I quickly became tired typing `docker-run` the prefix constantly (think `bundle exec`), knowing when to specify a MIX_ENV, and having to run post-commands after the fact (i.e. I just ran code coverage and so I now want to see the HTML report).  As a means of convenience, I created some bash scripts in the `mix/` directory. For example: 

Run tests (with code coverage):
```console
./mix/test-cover
```

### TODO

* Figure out if there is a way to suppress dialyzer warnings in tests which are known to intentionally produce those warnings
* Lots more

### Reference

Links that I have found to be helpful:

* Elixir - \[[Home](http://elixir-lang.org/)\] \[[Docs](http://elixir-lang.org/docs.html)\] \[[Source](https://github.com/elixir-lang/elixir)\] \[[Issues](https://github.com/elixir-lang/elixir/issues)\]
* [awesome-elixir](https://github.com/h4cc/awesome-elixir#applications)

