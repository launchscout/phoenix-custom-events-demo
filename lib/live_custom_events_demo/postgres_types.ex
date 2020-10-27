Postgrex.Types.define(
  LiveCustomEventsDemo.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Jason
)
