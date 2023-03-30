defmodule FoodTrucksWeb.FacilityLiveTest do
  use FoodTrucksWeb.ConnCase

  import Phoenix.LiveViewTest
  import FoodTrucks.FoodFixtures

  defp create_facility(_) do
    facility = facility_fixture()
    %{facility: facility}
  end

  describe "Index" do
    setup [:create_facility]

    test "lists all facilities", %{conn: conn, facility: facility} do
      {:ok, _index_live, html} = live(conn, ~p"/facilities")

      assert html =~ "Listing Facilities"
      assert html =~ facility.address
    end
  end

  describe "Show" do
    setup [:create_facility]

    test "displays facility", %{conn: conn, facility: facility} do
      {:ok, _show_live, html} = live(conn, ~p"/facilities/#{facility}")

      assert html =~ "Show Facility"
      assert html =~ facility.address
    end
  end
end
