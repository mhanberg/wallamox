defmodule Wallamox.Repo do
  use Ecto.Repo,
    otp_app: :wallamox,
    adapter: Ecto.Adapters.Postgres
end
