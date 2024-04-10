defmodule FoodTruck.FoodTruckInfos.FoodTruckInfo do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :applicant, :latitude, :longitude]}

  schema "food_truck_info" do
    field :address, :string
    field :applicant, :string
    field :facility_type, Ecto.Enum, values: [:unknown, :truck, :push_cart]
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck_info, attrs) do
    food_truck_info
    |> cast(attrs, [:id, :applicant, :facility_type, :address, :food_items, :latitude, :longitude])
    |> validate_required([:applicant, :facility_type, :address, :food_items, :latitude, :longitude])
  end
end
