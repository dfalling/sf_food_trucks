defmodule FoodTrucks.Food.Facility do
  @moduledoc """
  Schema for a Facility (either a food truck or a food cart.)
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "facilities" do
    field :address, :string
    field :applicant, :string
    field :approved, :naive_datetime
    field :block, :string
    field :blocklot, :string
    field :cnn, :integer
    field :days_hours, :string
    field :expiration_date, :naive_datetime
    field :facility_type, :string
    field :food_items, :string
    field :latitude, :float
    field :location_description, :string
    field :location_id, :integer
    field :longitude, :float
    field :lot, :string
    field :noi_sent, :naive_datetime
    field :permit, :string
    field :prior_permit, :boolean, default: false
    field :received, :naive_datetime
    field :schedule, :string
    field :status, :string
    field :x, :float
    field :y, :float

    timestamps()
  end

  @doc false
  def changeset(facility, attrs) do
    facility
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date
    ])
    |> validate_required([
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date
    ])
  end
end
