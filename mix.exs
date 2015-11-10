defmodule ElixirExamples.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_examples,
     version: "0.0.1",
     elixir: "~> 1.0",

     # Hex
     description: description,
     package: package,

     # Docs
     name: "Elixir Examples",
     docs: [
       readme: "README.md"
     ],

     source_url: "https://github.com/raniemi/elixir_examples",
     homepage_url: "https://github.com/raniemi/elixir_examples",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: Coverex.Task, log: :debug],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:inch_ex, only: :docs},             # Inline docs improvement suggestor
      {:earmark, "~> 0.1", only: :docs},   # Markdown parser
      {:ex_doc, "~> 0.10", only: :docs},   # HTML documentation generator
      {:coverex, "~> 1.4.1", only: :test}  # Code coverage
    ]
  end

  # Hex Package description
  defp description do
    """
    Elixir Examples is just as it's name suggests.  Please keep in mind that 
    it's primary purpose is meant for me to learn more the Elixir language and 
    its surrounding tools.  Perhaps you'll be able to benefit from it as well.
    """
  end

  # Hex Package definition
  defp package do
    [maintainers: ["Ross Niemi"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/raniemi/elixir_examples"}
    ]
  end  
end
