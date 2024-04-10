defmodule FoodTruckWeb.FoodTruckInfoLive.Index do
  use FoodTruckWeb, :live_view

  alias FoodTruck.FoodTruckInfos

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :food_truck_infos, [])}
  end

  @impl true
  def handle_event("bounds-changed", %{"bounds" => bounds_params}, socket) do
    %FoodTruckInfos.Bounds{}
    |> FoodTruckInfos.Bounds.bounds_from_params(bounds_params)
    |> case do
      {:ok, bounds} ->
        data = FoodTruckInfos.find_food_truck_infos(bounds)
        {:noreply, push_event(socket, "update_markers", %{data: data})}
      {:error, _errors} ->
        # TODO log error to telemetry and inform client
        {:noreply, socket}
    end
  end
end
