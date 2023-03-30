defmodule FoodTrucks.FoodTest do
  use FoodTrucks.DataCase

  alias FoodTrucks.Food

  describe "facilities" do
    alias FoodTrucks.Food.Facility

    import FoodTrucks.FoodFixtures

    @invalid_attrs %{
      address: nil,
      applicant: nil,
      approved: nil,
      block: nil,
      blocklot: nil,
      cnn: nil,
      days_hours: nil,
      expiration_date: nil,
      facility_type: nil,
      food_items: nil,
      latitude: nil,
      location_description: nil,
      location_id: nil,
      longitude: nil,
      lot: nil,
      noi_sent: nil,
      permit: nil,
      prior_permit: nil,
      received: nil,
      schedule: nil,
      status: nil,
      x: nil,
      y: nil
    }

    test "list_facilities/0 returns all facilities" do
      facility = facility_fixture()
      assert Food.list_facilities() == [facility]
    end

    test "get_facility!/1 returns the facility with given id" do
      facility = facility_fixture()
      assert Food.get_facility!(facility.id) == facility
    end

    test "create_facility/1 with valid data creates a facility" do
      valid_attrs = %{
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
      }

      assert {:ok, %Facility{} = facility} = Food.create_facility(valid_attrs)
      assert facility.address == "some address"
      assert facility.applicant == "some applicant"
      assert facility.approved == ~N[2023-03-29 07:31:00]
      assert facility.block == "some block"
      assert facility.blocklot == "some blocklot"
      assert facility.cnn == 42
      assert facility.days_hours == "some days_hours"
      assert facility.expiration_date == ~N[2023-03-29 07:31:00]
      assert facility.facility_type == "some facility_type"
      assert facility.food_items == "some food_items"
      assert facility.latitude == 120.5
      assert facility.location_description == "some location_description"
      assert facility.location_id == 42
      assert facility.longitude == 120.5
      assert facility.lot == "some lot"
      assert facility.noi_sent == ~N[2023-03-29 07:31:00]
      assert facility.permit == "some permit"
      assert facility.prior_permit == true
      assert facility.received == ~N[2023-03-29 07:31:00]
      assert facility.schedule == "some schedule"
      assert facility.status == "some status"
      assert facility.x == 120.5
      assert facility.y == 120.5
    end

    test "create_facility/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_facility(@invalid_attrs)
    end

    test "update_facility/2 with valid data updates the facility" do
      facility = facility_fixture()

      update_attrs = %{
        address: "some updated address",
        applicant: "some updated applicant",
        approved: ~N[2023-03-30 07:31:00],
        block: "some updated block",
        blocklot: "some updated blocklot",
        cnn: 43,
        days_hours: "some updated days_hours",
        expiration_date: ~N[2023-03-30 07:31:00],
        facility_type: "some updated facility_type",
        food_items: "some updated food_items",
        latitude: 456.7,
        location_description: "some updated location_description",
        location_id: 43,
        longitude: 456.7,
        lot: "some updated lot",
        noi_sent: ~N[2023-03-30 07:31:00],
        permit: "some updated permit",
        prior_permit: false,
        received: ~N[2023-03-30 07:31:00],
        schedule: "some updated schedule",
        status: "some updated status",
        x: 456.7,
        y: 456.7
      }

      assert {:ok, %Facility{} = facility} = Food.update_facility(facility, update_attrs)
      assert facility.address == "some updated address"
      assert facility.applicant == "some updated applicant"
      assert facility.approved == ~N[2023-03-30 07:31:00]
      assert facility.block == "some updated block"
      assert facility.blocklot == "some updated blocklot"
      assert facility.cnn == 43
      assert facility.days_hours == "some updated days_hours"
      assert facility.expiration_date == ~N[2023-03-30 07:31:00]
      assert facility.facility_type == "some updated facility_type"
      assert facility.food_items == "some updated food_items"
      assert facility.latitude == 456.7
      assert facility.location_description == "some updated location_description"
      assert facility.location_id == 43
      assert facility.longitude == 456.7
      assert facility.lot == "some updated lot"
      assert facility.noi_sent == ~N[2023-03-30 07:31:00]
      assert facility.permit == "some updated permit"
      assert facility.prior_permit == false
      assert facility.received == ~N[2023-03-30 07:31:00]
      assert facility.schedule == "some updated schedule"
      assert facility.status == "some updated status"
      assert facility.x == 456.7
      assert facility.y == 456.7
    end

    test "update_facility/2 with invalid data returns error changeset" do
      facility = facility_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_facility(facility, @invalid_attrs)
      assert facility == Food.get_facility!(facility.id)
    end

    test "delete_facility/1 deletes the facility" do
      facility = facility_fixture()
      assert {:ok, %Facility{}} = Food.delete_facility(facility)
      assert_raise Ecto.NoResultsError, fn -> Food.get_facility!(facility.id) end
    end

    test "change_facility/1 returns a facility changeset" do
      facility = facility_fixture()
      assert %Ecto.Changeset{} = Food.change_facility(facility)
    end
  end
end
