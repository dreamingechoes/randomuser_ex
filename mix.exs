defmodule RandomuserEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :randomuser_ex,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      description: description(),
      deps: deps(),
      docs: [
        main: "RandomuserEx"
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger, :httpoison, :exjsx]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:exjsx, "~> 4.0", app: false, override: true},
      {:httpoison, "~> 0.6"},
      {:excoveralls, "~> 0.7", only: :test},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end

  def package do
    [
      maintainers: ["dreamingechoes"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/dreamingechoes/randomuser_ex"}
    ]
  end

  def description do
    "Elixir wrapper to consume randomuser.me API"
  end
end
