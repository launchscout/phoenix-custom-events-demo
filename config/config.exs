# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_custom_events_demo,
  ecto_repos: [LiveCustomEventsDemo.Repo]

config :live_custom_events_demo, LiveCustomEventsDemo.Repo,
  types: LiveCustomEventsDemo.PostgresTypes,
  extensions: [{Geo.PostGIS.Extension, library: Geo}]

# Configures the endpoint
config :live_custom_events_demo, LiveCustomEventsDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "STUjDX52bX4v5F0FUJObEgRQ3q5FlBP63NkIByqtVieI6aHFZxfXnf7vbi84+fhW",
  render_errors: [view: LiveCustomEventsDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveCustomEventsDemo.PubSub,
  live_view: [signing_salt: "Rfh5lEUo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
