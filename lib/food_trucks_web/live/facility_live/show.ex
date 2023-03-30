defmodule FoodTrucksWeb.FacilityLive.Show do
  use FoodTrucksWeb, :live_view

  alias FoodTrucks.Food

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, "Show Facility")
     |> assign(:facility, Food.get_facility!(id))}
  end
end
