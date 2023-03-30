defmodule FoodTrucks.FoodFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTrucks.Food` context.
  """

  @doc """
  Generate a facility.
  """
  def facility_fixture(attrs \\ %{}) do
    {:ok, facility} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        approved: ~N[2023-03-29 07:31:00],
        block: "some block",
        blocklot: "some blocklot",
        cnn: 42,
        days_hours: "some days_hours",
        expiration_date: ~N[2023-03-29 07:31:00],
        facility_type: "some facility_type",
        food_items: "some food_items",
        latitude: 120.5,
        location_description: "some location_description",
        location_id: 42,
        longitude: 120.5,
        lot: "some lot",
        noi_sent: ~N[2023-03-29 07:31:00],
        permit: "some permit",
        prior_permit: true,
        received: ~N[2023-03-29 07:31:00],
        schedule: "some schedule",
        status: "some status",
        x: 120.5,
        y: 120.5
      })
      |> FoodTrucks.Food.create_facility()

    facility
  end
end
