defmodule FoodTruck.FoodTruckInfos.Bounds do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:east, :north, :south, :west]}

  embedded_schema do
    field :east, :float
    field :north, :float
    field :south, :float
    field :west, :float
  end

  def bounds_from_params(bounds, bounds_params) do
    bounds
    |> changeset(bounds_params)
    |> case do
      %Ecto.Changeset{valid?: true} = changeset ->
        {:ok, Ecto.Changeset.apply_changes(changeset)}
      %Ecto.Changeset{valid?: false} = changeset ->
        {:error, %{errors: changeset.errors}}
    end
  end

  def changeset(bounds, attrs \\ %{}) do
    bounds
    |> cast(attrs, [:east, :north, :south, :west])
    |> validate_required([:east, :north, :south, :west])
  end
end
