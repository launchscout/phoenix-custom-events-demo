defmodule LiveCustomEventsDemo.Repo do
  use Ecto.Repo,
    otp_app: :live_custom_events_demo,
    adapter: Ecto.Adapters.Postgres
end
