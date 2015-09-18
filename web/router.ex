defmodule Yada.Router do
  use Yada.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Yada do
    pipe_through :browser # Use the default browser stack

    get "/", TaskController, :index
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/session", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Yada do
  #   pipe_through :api
  # end
end
