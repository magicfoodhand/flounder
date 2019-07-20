defmodule FlounderCron.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      FlounderCron.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FlounderCron.Supervisor]
    Supervisor.start_link(children, opts)

    config :flounder_scheduler, FlounderCron.Scheduler,
           jobs: [
             # Every minute
             {"* * * * *", fn -> System.cmd("echo", ["Hello"]) end},
           ]
  end
end
