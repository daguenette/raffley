defmodule RaffleyWeb.RuleController do
  use RaffleyWeb, :controller

  alias Raffley.Rules

  def index(conn, _params) do
    rules = Rules.list_rules()
    render(conn, :index, rules: rules)
  end

  def show(conn, %{"id" => id}) do
    rule = Rules.get_rule(id)
    render(conn, :show, rule: rule)
  end
end
