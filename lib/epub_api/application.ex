defmodule EpubApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EpubApiWeb.Telemetry,
      EpubApi.Repo,
      {DNSCluster, query: Application.get_env(:epub_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EpubApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EpubApi.Finch},
      # Start a worker by calling: EpubApi.Worker.start_link(arg)
      # {EpubApi.Worker, arg},
      # Start to serve requests, typically the last entry
      EpubApiWeb.Endpoint,
      ExGram,
      {EpubApi.Bot, [method: :polling, token: "6572036459:AAHCV5wzjPtrq1nBzodbzhDpkROpZkHQrho"]}


    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EpubApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EpubApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
