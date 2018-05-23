use Mix.Config

config :projects, Projects.Repo,
  database: "projects_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :info
