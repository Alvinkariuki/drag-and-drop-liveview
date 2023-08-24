defmodule LiveviewDragAndDrop.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveviewDragAndDropWeb.Telemetry,
      # Start the Ecto repository
      LiveviewDragAndDrop.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveviewDragAndDrop.PubSub},
      # Start Finch
      {Finch, name: LiveviewDragAndDrop.Finch},
      # Start the Endpoint (http/https)
      LiveviewDragAndDropWeb.Endpoint
      # Start a worker by calling: LiveviewDragAndDrop.Worker.start_link(arg)
      # {LiveviewDragAndDrop.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewDragAndDrop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewDragAndDropWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
