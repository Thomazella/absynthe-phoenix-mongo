defmodule Community.Mixfile do
  use Mix.Project

  def project do
    [
      app: :community,
      version: "0.0.1",
      elixir: "~> 1.9.2",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: scripts(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Community.Application, []},
      extra_applications: [:logger, :runtime_tools, :mongodb, :poolboy],
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.10"},
      {:phoenix_pubsub, "~> 1.0"},
      {:postgrex, ">= 0.0.0"},
      {:poolboy, "~> 1.5.2"},
      {:ecto_sql, "~> 3.2.2"},
      {:gettext, "~> 0.11"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:absinthe, "~> 1.4.16"},
      {:absinthe_plug, "~> 1.4.7"},
      {:poison, "~> 3.0"},
      {:jason, "~> 1.1.2"},
      {:mongodb, "~> 0.5.1"},
      {:plug_cowboy, "~> 2.1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp scripts do
    [
      "db.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      # "db.drop": ["ecto.drop", "db.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      start: ["phx.server"],
      startup: ["install", "db.setup"],
      install: ["deps.get"]
    ]
  end
end
