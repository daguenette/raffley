defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles
  alias RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket = stream(socket, :raffles, Raffles.list_raffles())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="raffle-index">
      <CustomComponents.banner :if={false}>
        <.icon name="hero-sparkles-solid" /> Mystery Raffle Coming Soon!
        <:details :let={emoji}>To Be Revealed Tomorrow {emoji}</:details>
        <:details>Any guesses?</:details>
      </CustomComponents.banner>
      <div class="raffles" id="raffles" phx-update="stream">
        <.raffle_card :for={{dom_id, raffle} <- @streams.raffles} raffle={raffle} id={dom_id}/>
      </div>
    </div>
    """
  end

  attr :raffle, Raffley.Raffles.Raffle, required: true
  attr :id, :string, required: true

  def raffle_card(assigns) do
    ~H"""
    <.link navigate={~p"/raffles/#{@raffle}"} id={@id}>
      <div class="card">
        <img src={@raffle.image_path} />
        <h2>{@raffle.prize}</h2>
        <div class="details">
          <div class="price">
            $ {@raffle.ticket_price} / ticket
          </div>
          <CustomComponents.badge status={@raffle.status} />
        </div>
      </div>
    </.link>
    """
  end
end
