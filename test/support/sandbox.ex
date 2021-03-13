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
