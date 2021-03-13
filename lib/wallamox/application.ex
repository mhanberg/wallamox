defmodule Wallamox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Wallamox.Repo,
      # Start the Telemetry supervisor
      WallamoxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wallamox.PubSub},
      # Start the Endpoint (http/https)
      WallamoxWeb.Endpoint
      # Start a worker by calling: Wallamox.Worker.start_link(arg)
      # {Wallamox.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wallamox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WallamoxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
