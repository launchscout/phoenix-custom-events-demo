defmodule LiveCustomEventsDemo.ImportAirports do
  alias LiveCustomEventsDemo.Airports

  def import_airports() do
    File.stream!("#{__DIR__}/../../data/airports.csv")
    |> CSV.decode()
    |> Enum.to_list()
    |> convert_to_map_list()
    |> Enum.each(fn attrs -> create_airport(attrs |> atomize_keys()) end)
  end

  defp convert_to_map_list([{:ok, header_row} | data_tuples]) do
    Enum.map(data_tuples, fn {_, data} ->
      header_row |> Enum.zip(data) |> Enum.into(%{})
    end)
  end

  defp create_airport(%{latitude_deg: lat, longitude_deg: lng} = attrs) do
    attrs
    |> Map.put(:geo_location, %Geo.Point{coordinates: {lng, lat}})
    |> Airports.create_airport()
  end

  @spec atomize_keys(any) :: any
  def atomize_keys(%{__struct__: _} = map), do: map

  def atomize_keys(map) when is_map(map),
    do:
      Map.new(map, fn {k, v} ->
        {
          atomize_key(k),
          atomize_keys(v)
        }
      end)

  def atomize_keys(map), do: map

  defp atomize_key(key) when is_bitstring(key), do: String.to_atom(key)
  defp atomize_key(key), do: key
end
