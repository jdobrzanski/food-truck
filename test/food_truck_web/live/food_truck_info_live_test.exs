defmodule FoodTruckWeb.FoodTruckInfoLiveTest do
  use FoodTruckWeb.ConnCase

  import Phoenix.LiveViewTest
  import FoodTruck.FoodTruckInfosFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_food_truck_info(_) do
    food_truck_info = food_truck_info_fixture()
    %{food_truck_info: food_truck_info}
  end

  describe "Index" do
    setup [:create_food_truck_info]

    test "lists all food_truck_infos", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/food_truck_infos")

      assert html =~ "Listing Food truck infos"
    end
  end
end
