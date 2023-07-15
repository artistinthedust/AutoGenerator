defmodule AutoParserWeb.ItemsController do
  use AutoParserWeb, :controller

  alias AutoParser.Items

  def index(conn, _params) do
    items = Items.list_items()
    render(conn, "index.html", items: items)
  end
end
