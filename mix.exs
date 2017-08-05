defmodule Exhue.Mixfile do
  use Mix.Project

  def project do
    [app: :exhue,
     version: "0.1.6",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     name: "ExHue",
     source_url: "https://github.com/jodyalbritton/exhue"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
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
    [{:httpoison, "~> 0.11.1"},
     {:poison, "~> 3.1.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    A simple api client for the phillips hue light bridge.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :exhue,
      maintainers: ["Jody Albritton"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/jodyalbritton/exhue"}
    ]
  end
end
