defmodule FlounderArchive.MixProject do
  use Mix.Project

  def project do
    [
      app: :archive,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # https://github.com/meh/amnesia/issues/83
      # https://elixirforum.com/t/amnesia-problems-and-workarounds/17875
      {:amnesia, github: "meh/amnesia", branch: "master", override: true},
      {:exquisite, github: "meh/exquisite", branch: "master", override: true},
    ]
  end
end
