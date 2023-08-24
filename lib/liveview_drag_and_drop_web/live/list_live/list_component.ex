defmodule LiveviewDragAndDropWeb.ListLive.ListComponent do
  use LiveviewDragAndDropWeb, :live_component

  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(form: %{})
     |> assign(assigns)}
  end

  def handle_event("reposition", params, socket) do
    IO.inspect(params)

    {:noreply, socket}
  end
end
