defmodule LiveCustomEventsDemoWeb.PageLive do
  use LiveCustomEventsDemoWeb, :live_view
  alias LiveCustomEventsDemo.Airports

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, airports: [])}
  end

  @impl true
  def handle_event(
        "bounds_changed",
        %{"north" => north, "east" => east, "west" => west, "south" => south},
        socket
      ) do
    airports =
      Airports.list_airports_in_bounds(%{north: north, east: east, west: west, south: south})

    {:noreply, socket |> assign(airports: airports)}
  end
end
