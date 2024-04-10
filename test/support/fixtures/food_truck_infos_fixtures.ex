defmodule FoodTruck.FoodTruckInfosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruck.FoodTruckInfos` context.
  """

  @doc """
  Generate a food_truck_info.
  """
  def food_truck_info_fixture(attrs \\ %{}) do
    {:ok, food_truck_info} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        facility_type: :unknown,
        food_items: "some food_items",
        id: 42
      })
      |> FoodTruck.FoodTruckInfos.create_food_truck_info()

    food_truck_info
  end
end
