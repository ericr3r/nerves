defmodule Nerves.Mixfile do
  use Mix.Project

  def project do
    [app: :nerves,
     name: "Nerves",
     source_url: "https://github.com/nerves-project/nerves",
     homepage_url: "http://nerves-project.org/",
     version: "0.4.0",
     elixir: "~> 1.2.4 or ~> 1.3.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     aliases: ["docs": ["docs", &copy_images/1]],
     docs: docs()]
  end

  def application do
    []
  end

  defp deps do
    [
      {:exrm, "~> 1.0.4"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:porcelain, "~> 2.0"}
    ]
  end

  defp docs do
    [main: "getting-started",
     logo: "resources/logo.png",
     extras: [
        "docs/Installation.md",
        "docs/Getting Started.md",
        "docs/Targets.md",
        "docs/Systems.md",
        "docs/User Interfaces.md",
        "docs/Advanced Configuration.md"
    ]]
  end

  # Copy the images referenced by docs, since ex_doc doesn't do this.
  defp copy_images(_) do
    File.cp_r "resources", "doc/resources"
  end

  defp description do
    """
    Nerves - Create firmware for embedded devices like Raspberry Pi, BeagleBone Black, and more
    """
  end

  defp package do
    [maintainers: ["Frank Hunleth", "Garth Hitchens", "Justin Schneck", "Greg Mefford"],
     files: ["lib", "LICENSE", "mix.exs", "README.md", "template"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/nerves"}]
  end
end
