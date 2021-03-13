defmodule WallamoxWeb.PageController do
  use WallamoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
