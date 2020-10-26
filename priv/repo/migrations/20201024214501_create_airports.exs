defmodule LiveCustomEventsDemo.Repo.Migrations.CreateAirports do
  use Ecto.Migration

  def change do
    create table(:airports) do
      add :ident, :string
      add :type, :string
      add :name, :string
      add :geo_location, :geometry
      add :elevation_ft, :integer
      add :iso_country, :string
      add :iso_region, :string
      add :municipality, :string
      add :gps_code, :string
      add :iata_code, :string
      add :local_code, :string
      add :home_link, :string

      timestamps()
    end

  end
end
