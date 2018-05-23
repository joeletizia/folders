defmodule WebApiWeb.Router do
  use WebApiWeb, :router

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

  scope "/", WebApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", WebApiWeb do
    pipe_through :api

    get "/projects", ProjectsController, :index
    get "/folders/:id", FoldersController, :show
  end
end
