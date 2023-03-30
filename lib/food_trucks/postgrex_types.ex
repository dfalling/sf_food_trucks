Postgrex.Types.define(
  FoodTrucks.PostgrexTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Jason
)
