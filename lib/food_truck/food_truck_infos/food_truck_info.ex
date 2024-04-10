defmodule FoodTruck.FoodTruckInfos.FoodTruckInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_truck_info" do
    field :address, :string
    field :applicant, :string
    field :facility_type, Ecto.Enum, values: [:unknown, :truck, :push_cart]
    field :food_items, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck_info, attrs) do
    food_truck_info
    |> cast(attrs, [:id, :applicant, :facility_type, :address, :food_items])
    |> validate_required([:applicant, :facility_type, :address, :food_items])
  end
end
