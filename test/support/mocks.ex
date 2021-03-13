defmodule SomeBehaviour do
  @callback foo(bar :: String.t()) :: :ok 
end


Mox.defmock(SomeMock, for: SomeBehaviour)
Mox.defmock(AnotherMock, for: SomeBehaviour)
