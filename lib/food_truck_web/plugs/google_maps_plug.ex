defmodule FoodTruckWeb.Plugs.GoogleMapsPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    assign(conn, :gmaps_api_key, Application.get_env(:food_truck, :google_maps_api_key))
  end
end
