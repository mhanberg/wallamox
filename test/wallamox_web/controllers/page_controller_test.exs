defmodule WallamoxWeb.PageControllerTest do
  use WallamoxWeb.ConnCase

  import Mox

  setup :verify_on_exit!

  test "GET /", %{conn: conn} do
    Mox.expect(SomeMock, :foo, 1, fn arg ->
      assert arg == "bingo!"

      :ok
    end)

    Mox.expect(AnotherMock, :foo, 1, fn arg ->
      assert arg == "bango!"

      :ok
    end)

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
