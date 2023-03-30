defmodule FoodTrucks.Repo.Migrations.CreateFacilities do
  use Ecto.Migration

  def change do
    create table(:facilities) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :text
      add :days_hours, :text
      add :noi_sent, :naive_datetime
      add :approved, :naive_datetime
      add :received, :naive_datetime
      add :prior_permit, :boolean, default: false, null: false
      add :expiration_date, :naive_datetime

      timestamps()
    end
  end
end
