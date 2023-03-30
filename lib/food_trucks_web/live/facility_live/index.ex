defmodule FoodTrucksWeb.FacilityLive.Index do
  use FoodTrucksWeb, :live_view

  alias FoodTrucks.Food

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :facilities, Food.list_facilities())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Facilities")
    |> assign(:facility, nil)
  end
end
