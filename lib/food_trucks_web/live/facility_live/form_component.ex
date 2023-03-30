defmodule FoodTrucksWeb.FacilityLive.FormComponent do
  use FoodTrucksWeb, :live_component

  alias FoodTrucks.Food

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage facility records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="facility-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:location_id]} type="number" label="Location" />
        <.input field={@form[:applicant]} type="text" label="Applicant" />
        <.input field={@form[:facility_type]} type="text" label="Facility type" />
        <.input field={@form[:cnn]} type="number" label="Cnn" />
        <.input field={@form[:location_description]} type="text" label="Location description" />
        <.input field={@form[:address]} type="text" label="Address" />
        <.input field={@form[:blocklot]} type="text" label="Blocklot" />
        <.input field={@form[:block]} type="text" label="Block" />
        <.input field={@form[:lot]} type="text" label="Lot" />
        <.input field={@form[:permit]} type="text" label="Permit" />
        <.input field={@form[:status]} type="text" label="Status" />
        <.input field={@form[:food_items]} type="text" label="Food items" />
        <.input field={@form[:x]} type="number" label="X" step="any" />
        <.input field={@form[:y]} type="number" label="Y" step="any" />
        <.input field={@form[:latitude]} type="number" label="Latitude" step="any" />
        <.input field={@form[:longitude]} type="number" label="Longitude" step="any" />
        <.input field={@form[:schedule]} type="text" label="Schedule" />
        <.input field={@form[:days_hours]} type="text" label="Days hours" />
        <.input field={@form[:noi_sent]} type="datetime-local" label="Noi sent" />
        <.input field={@form[:approved]} type="datetime-local" label="Approved" />
        <.input field={@form[:received]} type="datetime-local" label="Received" />
        <.input field={@form[:prior_permit]} type="checkbox" label="Prior permit" />
        <.input field={@form[:expiration_date]} type="datetime-local" label="Expiration date" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Facility</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{facility: facility} = assigns, socket) do
    changeset = Food.change_facility(facility)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"facility" => facility_params}, socket) do
    changeset =
      socket.assigns.facility
      |> Food.change_facility(facility_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"facility" => facility_params}, socket) do
    save_facility(socket, socket.assigns.action, facility_params)
  end

  defp save_facility(socket, :edit, facility_params) do
    case Food.update_facility(socket.assigns.facility, facility_params) do
      {:ok, facility} ->
        notify_parent({:saved, facility})

        {:noreply,
         socket
         |> put_flash(:info, "Facility updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_facility(socket, :new, facility_params) do
    case Food.create_facility(facility_params) do
      {:ok, facility} ->
        notify_parent({:saved, facility})

        {:noreply,
         socket
         |> put_flash(:info, "Facility created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
