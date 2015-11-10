Elixir Examples
===============

This git repository is used (by me) to document things I have learned about the Elixir language and to test out new tools that support it.

### Prerequisites

If you want to use this then you'll need to [install](http://elixir-lang.org/install.html) [Elixir](http://elixir-lang.org/) first.

### Reference

Links that I have found to be helpful:

* Elixir - \[[Home](http://elixir-lang.org/)\] \[[Docs](http://elixir-lang.org/docs.html)\] \[[Source](https://github.com/elixir-lang/elixir)\] \[[Issues](https://github.com/elixir-lang/elixir/issues)\]
* [awesome-elixir](https://github.com/h4cc/awesome-elixir#applications)

### Background

This Elixir project was created using [mix](http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html):
```console
mix new elixir_examples --module ElixirExamples
```

### Usage

To use this repository:
```console
git clone https://github.com/raniemi/elixir_examples.git
cd elixir_examples
mix do deps.get, compile
```

Run tests using:
```console
mix test
```

Run tests with code coverage:
```console
mix test --cover
```

Generate documentation:
```console
MIX_ENV=docs mix docs
```

Hints on improving inline docs
```console
MIX_ENV=docs mix inch
```

### TODO

* Figure out if there is a way to suppress dialyzer warnings in tests which are known to intentionally produce those warnings
* Lots more
