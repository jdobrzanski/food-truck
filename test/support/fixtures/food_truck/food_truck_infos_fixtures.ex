defmodule FoodTruck.FoodTruck.FoodTruckInfosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruck.FoodTruck.FoodTruckInfos` context.
  """

  @doc """
  Generate a food_truck_info.
  """
  def food_truck_info_fixture(attrs \\ %{}) do
    {:ok, food_truck_info} =
      attrs
      |> Enum.into(%{

      })
      |> FoodTruck.FoodTruck.FoodTruckInfos.create_food_truck_info()

    food_truck_info
  end
end
