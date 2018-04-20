defmodule PhxWeb.Router do
  use PhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxWeb do
    pipe_through :api
  end
end
