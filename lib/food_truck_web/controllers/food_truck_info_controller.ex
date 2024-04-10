defmodule FoodTruckWeb.FoodTruckInfoController do
  use FoodTruckWeb, :controller

  alias FoodTruck.FoodTruckInfos
  alias FoodTruck.FoodTruckInfos.FoodTruckInfo

  action_fallback FoodTruckWeb.FallbackController

  def index(conn, _params) do
    food_truck_info = FoodTruckInfos.list_food_truck_info()
    render(conn, :index, food_truck_info: food_truck_info)
  end

  def create(conn, %{"food_truck_info" => food_truck_info_params}) do
    with {:ok, %FoodTruckInfo{} = food_truck_info} <- FoodTruckInfos.create_food_truck_info(food_truck_info_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/food_truck_info/#{food_truck_info}")
      |> render(:show, food_truck_info: food_truck_info)
    end
  end

  def show(conn, %{"id" => id}) do
    food_truck_info = FoodTruckInfos.get_food_truck_info!(id)
    render(conn, :show, food_truck_info: food_truck_info)
  end

  def update(conn, %{"id" => id, "food_truck_info" => food_truck_info_params}) do
    food_truck_info = FoodTruckInfos.get_food_truck_info!(id)

    with {:ok, %FoodTruckInfo{} = food_truck_info} <- FoodTruckInfos.update_food_truck_info(food_truck_info, food_truck_info_params) do
      render(conn, :show, food_truck_info: food_truck_info)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_truck_info = FoodTruckInfos.get_food_truck_info!(id)

    with {:ok, %FoodTruckInfo{}} <- FoodTruckInfos.delete_food_truck_info(food_truck_info) do
      send_resp(conn, :no_content, "")
    end
  end
end
