defmodule FoodTruckWeb.FoodTruckInfoControllerTest do
  use FoodTruckWeb.ConnCase

  import FoodTruck.FoodTruckInfosFixtures

  alias FoodTruck.FoodTruckInfos.FoodTruckInfo

  @create_attrs %{
    id: 42,
    address: "some address",
    applicant: "some applicant",
    facility_type: :unknown,
    food_items: "some food_items"
  }
  @update_attrs %{
    id: 43,
    address: "some updated address",
    applicant: "some updated applicant",
    facility_type: :truck,
    food_items: "some updated food_items"
  }
  @invalid_attrs %{id: nil, address: nil, applicant: nil, facility_type: nil, food_items: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all food_truck_info", %{conn: conn} do
      conn = get(conn, ~p"/api/food_truck_info")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food_truck_info" do
    test "renders food_truck_info when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/food_truck_info", food_truck_info: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/food_truck_info/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "applicant" => "some applicant",
               "facility_type" => "unknown",
               "food_items" => "some food_items",
               "id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/food_truck_info", food_truck_info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food_truck_info" do
    setup [:create_food_truck_info]

    test "renders food_truck_info when data is valid", %{conn: conn, food_truck_info: %FoodTruckInfo{id: id} = food_truck_info} do
      conn = put(conn, ~p"/api/food_truck_info/#{food_truck_info}", food_truck_info: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/food_truck_info/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "applicant" => "some updated applicant",
               "facility_type" => "truck",
               "food_items" => "some updated food_items",
               "id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food_truck_info: food_truck_info} do
      conn = put(conn, ~p"/api/food_truck_info/#{food_truck_info}", food_truck_info: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food_truck_info" do
    setup [:create_food_truck_info]

    test "deletes chosen food_truck_info", %{conn: conn, food_truck_info: food_truck_info} do
      conn = delete(conn, ~p"/api/food_truck_info/#{food_truck_info}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/food_truck_info/#{food_truck_info}")
      end
    end
  end

  defp create_food_truck_info(_) do
    food_truck_info = food_truck_info_fixture()
    %{food_truck_info: food_truck_info}
  end
end
