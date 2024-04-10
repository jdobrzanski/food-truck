# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTruck.Repo.insert!(%FoodTruck.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FoodTruck.{FoodTruckInfos, Repo}
alias FoodTruck.FoodTruckInfos.FoodTruckInfo

defmodule FoodTruck.Seeds do
  def execute_in_transaction() do
    Repo.transaction(fn ->
      "priv/repo/data/Mobile_Food_Facility_Permit.csv"
      |> stream_to_params()
      |> Stream.map(fn params ->
        params
        |> FoodTruckInfos.create_food_truck_info()
        |> case do
          {:ok, %FoodTruckInfo{}} ->
            # all good
            # allowing other cases to fail and throw
            # to halt and rollback seeding
          end
      end)
      |> Stream.run()
    end)
  end

  defp stream_to_params(file) do
    file
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Stream.filter(fn row ->
      row["Status"] == "APPROVED"
    end)
    |> Stream.map(fn row ->
      # little point in getting clever here
      # with string manipulations and mappings
      # as we don't need to use these mappings
      # again and abstractions would obfuscate
      %{
        "id" => row["locationid"],
        "applicant" => row["Applicant"],
        "address" => row["Address"],
        "facility_type" => Macro.underscore(String.replace(row["FacilityType"], " ", "")),
        "food_items" => row["FoodItems"],
        "latitude" => row["Latitude"],
        "longitude" => row["Longitude"]
      }
    end)
  end
end

FoodTruck.Seeds.execute_in_transaction()
