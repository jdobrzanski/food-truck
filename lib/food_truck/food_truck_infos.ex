defmodule FoodTruck.FoodTruckInfos do
  @moduledoc """
  The FoodTruckInfos context.
  """

  import Ecto.Query, warn: false
  alias FoodTruck.Repo

  alias FoodTruck.FoodTruckInfos.{Bounds, FoodTruckInfo}

  @doc """
  Returns the list of food_truck_info.

  ## Examples

      iex> list_food_truck_info()
      [%FoodTruckInfo{}, ...]

  """
  def list_food_truck_info do
    Repo.all(FoodTruckInfo)
  end

  @doc """
  Returns food_truck_infos within the specified bounds.

  ## Examples

      iex> find_food_truck_infos(%Bounds{east: -122.20818034122128, north: 37.86220385046159, south: 37.65591845232061, west: -122.66685954044003})
      [%FoodTruckInfo{}, ...]

  """
  def find_food_truck_infos(%Bounds{} = bounds) do
    (from fti in FoodTruckInfo,
      where:
        fti.longitude < ^(bounds.east) and fti.longitude > ^(bounds.west) and
        fti.latitude < ^(bounds.north) and fti.latitude > ^(bounds.south),
      limit: 15)
    |> Repo.all()
  end

  @doc """
  Gets a single food_truck_info.

  Raises `Ecto.NoResultsError` if the Food truck info does not exist.

  ## Examples

      iex> get_food_truck_info!(123)
      %FoodTruckInfo{}

      iex> get_food_truck_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_truck_info!(id), do: Repo.get!(FoodTruckInfo, id)

  @doc """
  Creates a food_truck_info.

  ## Examples

      iex> create_food_truck_info(%{field: value})
      {:ok, %FoodTruckInfo{}}

      iex> create_food_truck_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_truck_info(attrs \\ %{}) do
    %FoodTruckInfo{}
    |> FoodTruckInfo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_truck_info.

  ## Examples

      iex> update_food_truck_info(food_truck_info, %{field: new_value})
      {:ok, %FoodTruckInfo{}}

      iex> update_food_truck_info(food_truck_info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_truck_info(%FoodTruckInfo{} = food_truck_info, attrs) do
    food_truck_info
    |> FoodTruckInfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_truck_info.

  ## Examples

      iex> delete_food_truck_info(food_truck_info)
      {:ok, %FoodTruckInfo{}}

      iex> delete_food_truck_info(food_truck_info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_truck_info(%FoodTruckInfo{} = food_truck_info) do
    Repo.delete(food_truck_info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_truck_info changes.

  ## Examples

      iex> change_food_truck_info(food_truck_info)
      %Ecto.Changeset{data: %FoodTruckInfo{}}

  """
  def change_food_truck_info(%FoodTruckInfo{} = food_truck_info, attrs \\ %{}) do
    FoodTruckInfo.changeset(food_truck_info, attrs)
  end
end
