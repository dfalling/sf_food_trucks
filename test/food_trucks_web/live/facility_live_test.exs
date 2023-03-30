defmodule FoodTrucksWeb.FacilityLiveTest do
  use FoodTrucksWeb.ConnCase

  import Phoenix.LiveViewTest
  import FoodTrucks.FoodFixtures

  @create_attrs %{address: "some address", applicant: "some applicant", approved: "2023-03-29T07:31:00", block: "some block", blocklot: "some blocklot", cnn: 42, days_hours: "some days_hours", expiration_date: "2023-03-29T07:31:00", facility_type: "some facility_type", food_items: "some food_items", latitude: 120.5, location_description: "some location_description", location_id: 42, longitude: 120.5, lot: "some lot", noi_sent: "2023-03-29T07:31:00", permit: "some permit", prior_permit: true, received: "2023-03-29T07:31:00", schedule: "some schedule", status: "some status", x: 120.5, y: 120.5}
  @update_attrs %{address: "some updated address", applicant: "some updated applicant", approved: "2023-03-30T07:31:00", block: "some updated block", blocklot: "some updated blocklot", cnn: 43, days_hours: "some updated days_hours", expiration_date: "2023-03-30T07:31:00", facility_type: "some updated facility_type", food_items: "some updated food_items", latitude: 456.7, location_description: "some updated location_description", location_id: 43, longitude: 456.7, lot: "some updated lot", noi_sent: "2023-03-30T07:31:00", permit: "some updated permit", prior_permit: false, received: "2023-03-30T07:31:00", schedule: "some updated schedule", status: "some updated status", x: 456.7, y: 456.7}
  @invalid_attrs %{address: nil, applicant: nil, approved: nil, block: nil, blocklot: nil, cnn: nil, days_hours: nil, expiration_date: nil, facility_type: nil, food_items: nil, latitude: nil, location_description: nil, location_id: nil, longitude: nil, lot: nil, noi_sent: nil, permit: nil, prior_permit: false, received: nil, schedule: nil, status: nil, x: nil, y: nil}

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

    test "saves new facility", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/facilities")

      assert index_live |> element("a", "New Facility") |> render_click() =~
               "New Facility"

      assert_patch(index_live, ~p"/facilities/new")

      assert index_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#facility-form", facility: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/facilities")

      html = render(index_live)
      assert html =~ "Facility created successfully"
      assert html =~ "some address"
    end

    test "updates facility in listing", %{conn: conn, facility: facility} do
      {:ok, index_live, _html} = live(conn, ~p"/facilities")

      assert index_live |> element("#facilities-#{facility.id} a", "Edit") |> render_click() =~
               "Edit Facility"

      assert_patch(index_live, ~p"/facilities/#{facility}/edit")

      assert index_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#facility-form", facility: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/facilities")

      html = render(index_live)
      assert html =~ "Facility updated successfully"
      assert html =~ "some updated address"
    end

    test "deletes facility in listing", %{conn: conn, facility: facility} do
      {:ok, index_live, _html} = live(conn, ~p"/facilities")

      assert index_live |> element("#facilities-#{facility.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#facilities-#{facility.id}")
    end
  end

  describe "Show" do
    setup [:create_facility]

    test "displays facility", %{conn: conn, facility: facility} do
      {:ok, _show_live, html} = live(conn, ~p"/facilities/#{facility}")

      assert html =~ "Show Facility"
      assert html =~ facility.address
    end

    test "updates facility within modal", %{conn: conn, facility: facility} do
      {:ok, show_live, _html} = live(conn, ~p"/facilities/#{facility}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Facility"

      assert_patch(show_live, ~p"/facilities/#{facility}/show/edit")

      assert show_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#facility-form", facility: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/facilities/#{facility}")

      html = render(show_live)
      assert html =~ "Facility updated successfully"
      assert html =~ "some updated address"
    end
  end
end
