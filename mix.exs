defmodule EctoCastToString.Mixfile do
  use Mix.Project

  @description "EctoCastToString is a simple library that enables ecto casting from int/float to string."
  @version "0.1.0"

  def project do
    [app: :ecto_cast_to_string,
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: @description,
     source_url: "https://github.com/luizParreira/ecto_cast_to_string",
     docs: [extras: ["README.md"], main: "EctoCastToString"],
     deps: deps(),
     package: package()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  def package do
    [
      maintainers: ["Luiz Parreira"],
      licenses: ["MIT"],
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      links: %{"GitHub" => "https://github.com/luizParreira/ecto_cast_to_string"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ecto, "~> 2.1"},
     {:ex_doc, "~> 0.14", only: :dev}]
  end
end
