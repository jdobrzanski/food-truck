defmodule FoodTruck.Repo.Migrations.UpdateFoodTruckInfoTable do
  use Ecto.Migration

  def change do
    alter table(:food_truck_info) do
      modify :food_items, :text, from: :string
      add :latitude, :float
      add :longitude, :float
    end
  end
end
