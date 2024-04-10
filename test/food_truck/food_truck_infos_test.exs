defmodule FoodTruck.FoodTruckInfosTest do
  use FoodTruck.DataCase

  alias FoodTruck.FoodTruckInfos

  describe "food_truck_info" do
    alias FoodTruck.FoodTruckInfos.FoodTruckInfo

    import FoodTruck.FoodTruckInfosFixtures

    @invalid_attrs %{id: nil, address: nil, applicant: nil, facility_type: nil, food_items: nil}

    test "list_food_truck_info/0 returns all food_truck_info" do
      food_truck_info = food_truck_info_fixture()
      assert FoodTruckInfos.list_food_truck_info() == [food_truck_info]
    end

    test "get_food_truck_info!/1 returns the food_truck_info with given id" do
      food_truck_info = food_truck_info_fixture()
      assert FoodTruckInfos.get_food_truck_info!(food_truck_info.id) == food_truck_info
    end

    test "create_food_truck_info/1 with valid data creates a food_truck_info" do
      valid_attrs = %{id: 42, address: "some address", applicant: "some applicant", facility_type: :unknown, food_items: "some food_items"}

      assert {:ok, %FoodTruckInfo{} = food_truck_info} = FoodTruckInfos.create_food_truck_info(valid_attrs)
      assert food_truck_info.id == 42
      assert food_truck_info.address == "some address"
      assert food_truck_info.applicant == "some applicant"
      assert food_truck_info.facility_type == :unknown
      assert food_truck_info.food_items == "some food_items"
    end

    test "create_food_truck_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTruckInfos.create_food_truck_info(@invalid_attrs)
    end

    test "update_food_truck_info/2 with valid data updates the food_truck_info" do
      food_truck_info = food_truck_info_fixture()
      update_attrs = %{id: 43, address: "some updated address", applicant: "some updated applicant", facility_type: :truck, food_items: "some updated food_items"}

      assert {:ok, %FoodTruckInfo{} = food_truck_info} = FoodTruckInfos.update_food_truck_info(food_truck_info, update_attrs)
      assert food_truck_info.id == 43
      assert food_truck_info.address == "some updated address"
      assert food_truck_info.applicant == "some updated applicant"
      assert food_truck_info.facility_type == :truck
      assert food_truck_info.food_items == "some updated food_items"
    end

    test "update_food_truck_info/2 with invalid data returns error changeset" do
      food_truck_info = food_truck_info_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodTruckInfos.update_food_truck_info(food_truck_info, @invalid_attrs)
      assert food_truck_info == FoodTruckInfos.get_food_truck_info!(food_truck_info.id)
    end

    test "delete_food_truck_info/1 deletes the food_truck_info" do
      food_truck_info = food_truck_info_fixture()
      assert {:ok, %FoodTruckInfo{}} = FoodTruckInfos.delete_food_truck_info(food_truck_info)
      assert_raise Ecto.NoResultsError, fn -> FoodTruckInfos.get_food_truck_info!(food_truck_info.id) end
    end

    test "change_food_truck_info/1 returns a food_truck_info changeset" do
      food_truck_info = food_truck_info_fixture()
      assert %Ecto.Changeset{} = FoodTruckInfos.change_food_truck_info(food_truck_info)
    end
  end
end
