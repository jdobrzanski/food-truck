defmodule FoodTruck.Repo.Migrations.AddLatLngIndexes do
  use Ecto.Migration

  def change do
    create index("food_truck_info", [:latitude])
    create index("food_truck_info", [:longitude])
  end
end
