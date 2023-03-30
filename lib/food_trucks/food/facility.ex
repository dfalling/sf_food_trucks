defmodule FoodTrucks.Food.Facility do
  @moduledoc """
  Schema for a Facility (either a food truck or a food cart.)
  """
  use TypedEctoSchema
  use EnumType
  import Ecto.Changeset

  defenum FacilityType do
    value(PushCart, "Push Cart")
    value(Truck, "Truck")
  end

  defenum Status do
    value(Approved, "APPROVED")
    value(Requested, "REQUESTED")
  end

  typed_schema "facilities" do
    field :address, :string
    field :applicant, :string
    field :approved, :naive_datetime
    field :block, :string
    field :blocklot, :string
    field :cnn, :integer
    field :days_hours, :string
    field :expiration_date, :naive_datetime
    field :facility_type, FacilityType
    field :food_items, :string
    field :latitude, :float
    field :location_description, :string
    field(:geometry, Geo.PostGIS.Geometry) :: Geo.Point.t()
    field :location_id, :integer
    field :longitude, :float
    field :lot, :string
    field :noi_sent, :naive_datetime
    field :permit, :string
    field :prior_permit, :boolean, default: false
    field :received, :string
    field :schedule, :string
    field :status, Status
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
    |> populate_geometry()
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
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :prior_permit,
      :expiration_date,
      :geometry
    ])
    |> FacilityType.validate(:facility_type)
    |> Status.validate(:status)
  end

  defp populate_geometry(changeset) do
    # only update geometry if latitude or longitude changed
    has_change = not is_nil(get_change(changeset, :latitude) || get_change(changeset, :longitude))

    if has_change do
      # use from get_field in case only one is updated
      latitude = get_field(changeset, :latitude)
      longitude = get_field(changeset, :longitude)

      geometry = %Geo.Point{
        srid: 4326,
        coordinates: {
          longitude,
          latitude
        }
      }

      changeset
      |> put_change(
        :geometry,
        geometry
      )
    else
      changeset
    end
  end
end
