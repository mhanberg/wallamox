# Wallamox

Demonstration of setting up Mox to work effectively with Wallaby.

Note: This demonstration was built using the guidance from [Jon Leighton](https://github.com/jonleighton) in this [PR](https://github.com/elixir-wallaby/wallaby/pull/592).

### Sandbox

```elixir
defmodule Wallamox.Sandbox do
  def allow(repo, owner_pid, child_pid) do
    # Delegate to the Ecto sandbox
    Ecto.Adapters.SQL.Sandbox.allow(repo, owner_pid, child_pid)

    # Add custom process-sharing configuration
    for mock <- [SomeMock, AnotherMock] do
      Mox.allow(mock, owner_pid, child_pid)
    end
  end
end
```

### Test

Note during this test that we are not calling `Mox.set_mox_global` and are running the test with `async: true`.

```elixir
defmodule WallamoxWeb.PageFeatureTest do
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
```
---

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
