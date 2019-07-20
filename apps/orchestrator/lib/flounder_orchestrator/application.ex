defmodule FlounderOrchestrator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    options = [
      {Task.Supervisor, name: FlounderOrchestrator.Supervisor, restart: :transient}
    ]

    {:ok, pid} = Supervisor.start_link(options, strategy: :one_for_one)
  end
end
