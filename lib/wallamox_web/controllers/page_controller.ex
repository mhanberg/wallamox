defmodule WallamoxWeb.PageController do
  use WallamoxWeb, :controller

  def index(conn, _params) do
    some_mod().foo("bingo!")
    another_mod().foo("bango!")

    render(conn, "index.html")
  end

  defp some_mod, do: Application.get_env(:wallamox, :mod, Wallamox.ARealMod)
  defp another_mod, do: Application.get_env(:wallamox, :mod2, Wallamox.ARealMod)
end
