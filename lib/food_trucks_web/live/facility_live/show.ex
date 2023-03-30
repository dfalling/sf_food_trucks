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
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:facility, Food.get_facility!(id))}
  end

  defp page_title(:show), do: "Show Facility"
  defp page_title(:edit), do: "Edit Facility"
end
