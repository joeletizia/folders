defmodule Projects.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Projects.Repo,
      # Starts a worker by calling: Projects.Worker.start_link(arg)
      # {Projects.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Projects.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
