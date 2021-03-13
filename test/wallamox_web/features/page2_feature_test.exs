defmodule WallamoxWeb.Page2FeatureTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  alias WallamoxWeb.Router.Helpers, as: Routes
  @endpoint WallamoxWeb.Endpoint

  import Mox

  setup :verify_on_exit!

  feature "goes to the main page", %{session: session} do
    Mox.expect(SomeMock, :foo, 1, fn arg ->
      assert arg == "bingo!"

      :ok
    end)

    Mox.expect(AnotherMock, :foo, 1, fn arg ->
      assert arg == "bango!"

      :ok
    end)

    session
    |> visit(Routes.page_path(@endpoint, :index))
    |> assert_text("Peace of mind from prototype to production")
  end
end
