defmodule FlounderServiceWeb.Router do
  use FlounderServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FlounderServiceWeb do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL,
            schema: FlounderServiceWeb.Schema,
            interface: :simple,
            context: %{pubsub: FlounderServiceWeb.Endpoint}
  end
end
