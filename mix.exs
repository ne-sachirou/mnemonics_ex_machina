defmodule Mnemonics.ExMachina.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mnemonics_ex_machina,
      deps: deps(),
      description: "ExMachina strategy for Mnemonics.",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.1.0",

      # Docs
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      homepage_url: "https://github.com/ne-sachirou/mnemonics_ex_machina",
      name: "Mnemonics.ExMachina",
      source_url: "https://github.com/ne-sachirou/mnemonics_ex_machina"
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:ex_machina, "~> 2.1"},
      {:inner_cotton, github: "ne-sachirou/inner_cotton", only: [:dev, :test]},
      {:mnemonics, "~> 0.2", only: :test}
    ]
  end

  defp elixirc_paths(:test), do: ~w(lib test/support)
  defp elixirc_paths(_), do: ~w(lib)

  def package do
    [
      files: ["LICENSE", "README.md", "mix.exs", "lib"],
      licenses: ["GPL-3.0"],
      links: %{
        GitHub: "https://github.com/ne-sachirou/mnemonics_ex_machina"
      },
      maintainers: ["ne_Sachirou <utakata.c4se@gmail.com>"],
      name: :mnemonics_ex_machina
    ]
  end
end
