defmodule FoodTruckWeb.FoodTruckInfoJSON do
  alias FoodTruck.FoodTruckInfos.FoodTruckInfo

  @doc """
  Renders a list of food_truck_info.
  """
  def index(%{food_truck_info: food_truck_info}) do
    %{data: for(food_truck_info <- food_truck_info, do: data(food_truck_info))}
  end

  @doc """
  Renders a single food_truck_info.
  """
  def show(%{food_truck_info: food_truck_info}) do
    %{data: data(food_truck_info)}
  end

  defp data(%FoodTruckInfo{} = food_truck_info) do
    %{
      id: food_truck_info.id,
      applicant: food_truck_info.applicant,
      facility_type: food_truck_info.facility_type,
      address: food_truck_info.address,
      food_items: food_truck_info.food_items,
      latitude: food_truck_info.latitude,
      longitude: food_truck_info.longitude
    }
  end
end
