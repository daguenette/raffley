defmodule RaffleyWeb.RuleController do
  use RaffleyWeb, :controller

  alias Raffley.Rules

  def index(conn, _params) do
    rules = Rules.list_rules()
    render(conn, :index, rules: rules)
  end
end
