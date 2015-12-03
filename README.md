[![Build Status](https://travis-ci.org/raniemi/elixir_examples.svg?branch=master)](https://travis-ci.org/raniemi/elixir_examples)
[![Coverage Status](https://coveralls.io/repos/raniemi/elixir_examples/badge.svg?branch=master&service=github)](https://coveralls.io/github/raniemi/elixir_examples?branch=master)

Elixir Examples
===============

This git repository is used (by me) to document things I have learned about the Elixir language and to test out new tools that support it.

### Prerequisites

If you want to use this then you'll need to either [install](http://elixir-lang.org/install.html) [Elixir](http://elixir-lang.org/) first or use the [Docker Toolbox](https://www.docker.com/docker-toolbox).  If you decide to use docker then after installing the toolbox you will need to build the docker image as follows:

```console
docker build -t raniemi/elixir_examples .
```

### Reference

Links that I have found to be helpful:

* Elixir - \[[Home](http://elixir-lang.org/)\] \[[Docs](http://elixir-lang.org/docs.html)\] \[[Source](https://github.com/elixir-lang/elixir)\] \[[Issues](https://github.com/elixir-lang/elixir/issues)\]
* [awesome-elixir](https://github.com/h4cc/awesome-elixir#applications)

### Background

This Elixir project was originally created using [mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html):
```console
mix new elixir_examples --module ElixirExamples
```
### Usage

To use this repository:
```console
git clone https://github.com/raniemi/elixir_examples.git
cd elixir_examples
```

Then you can either use mix directly:
```console
mix do deps.get, compile
```

Or if you want to use the docker container then prefix the same command with ./docker-run.  For example:
```console
./docker-run mix do deps.get, compile
```

### Helpful Commands

Run tests:
```console
mix test
```

Run tests with code coverage:
```console
mix test --cover
open cover/modules.html (OSX)
```

Generate documentation:
```console
MIX_ENV=docs mix docs
open doc/index.html (OSX)
```

Hints on improving inline docs:
```console
MIX_ENV=docs mix inch
```

List of code analysis issues grouped by files:
```console
mix credo list
```

Code linter:
```console
mix dogma
```

### TODO

* Figure out if there is a way to suppress dialyzer warnings in tests which are known to intentionally produce those warnings
* Lots more
