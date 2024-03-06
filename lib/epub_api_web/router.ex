defmodule EpubApiWeb.Router do
  use EpubApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EpubApiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EpubApiWeb do
    pipe_through :browser

    get "/", PageController, :home
    post "/:token", TelegramController, :update

    resources "/books", BookController
    resources "/libraries", LibraryController
    resources "/users", UserController
  end

  if Application.compile_env(:epub_api, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EpubApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
