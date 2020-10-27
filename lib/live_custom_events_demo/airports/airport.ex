defmodule LiveCustomEventsDemo.Airports.Airport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "airports" do
    field :elevation_ft, :integer
    field :geo_location, Geo.PostGIS.Geometry
    field :gps_code, :string
    field :home_link, :string
    field :iata_code, :string
    field :ident, :string
    field :iso_country, :string
    field :iso_region, :string
    field :local_code, :string
    field :municipality, :string
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(airport, attrs) do
    airport
    |> cast(attrs, [
      :ident,
      :type,
      :name,
      :geo_location,
      :elevation_ft,
      :iso_country,
      :iso_region,
      :municipality,
      :gps_code,
      :iata_code,
      :local_code,
      :home_link
    ])
    |> validate_required([
      :ident,
      :type,
      :name,
      :geo_location,
      :elevation_ft,
      :iso_country,
      :iso_region,
      :municipality,
      :iata_code
    ])
  end
end
