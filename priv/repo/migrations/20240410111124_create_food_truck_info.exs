defmodule FoodTruck.Repo.Migrations.CreateFoodTruckInfo do
  use Ecto.Migration

  def change do
    create table(:food_truck_info) do
      add :applicant, :string
      add :facility_type, :string
      add :address, :string
      add :food_items, :string

      timestamps(type: :utc_datetime)
    end
  end
end
