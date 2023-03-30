defmodule FoodTrucksWeb.FacilityLive.Index do
  use FoodTrucksWeb, :live_view

  alias FoodTrucks.Food
  alias FoodTrucks.Food.Facility

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :facilities, Food.list_facilities())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Facility")
    |> assign(:facility, Food.get_facility!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Facility")
    |> assign(:facility, %Facility{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Facilities")
    |> assign(:facility, nil)
  end

  @impl true
  def handle_info({FoodTrucksWeb.FacilityLive.FormComponent, {:saved, facility}}, socket) do
    {:noreply, stream_insert(socket, :facilities, facility)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    facility = Food.get_facility!(id)
    {:ok, _} = Food.delete_facility(facility)

    {:noreply, stream_delete(socket, :facilities, facility)}
  end
end
