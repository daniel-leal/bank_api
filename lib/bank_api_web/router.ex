defmodule BankApiWeb.Router do
  use BankApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankApiWeb do
    pipe_through :api

    resources "/banks", BankController, except: [:new, :edit] do
      resources "/branches", BranchController, except: [:new, :edit]
    end
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BankApiWeb.Telemetry
    end
  end
end
