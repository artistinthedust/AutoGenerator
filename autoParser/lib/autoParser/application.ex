defmodule AutoParser.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AutoParserWeb.Telemetry,
      # Start the Ecto repository
      AutoParser.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AutoParser.PubSub},
      # Start Finch
      {Finch, name: AutoParser.Finch},
      # Start the Endpoint (http/https)
      AutoParserWeb.Endpoint
      # Start a worker by calling: AutoParser.Worker.start_link(arg)
      # {AutoParser.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AutoParser.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AutoParserWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
