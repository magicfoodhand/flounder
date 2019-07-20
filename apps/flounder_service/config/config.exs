# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flounder_service,
  namespace: FlounderService

# Configures the endpoint
config :flounder_service, FlounderServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Pb+mBFHazcYFHzMdP4DdtvlQkpIB6TnwAwq69X2EdOkjw9E7Q9EwOb81JgVOLemp",
  render_errors: [view: FlounderServiceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FlounderService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
