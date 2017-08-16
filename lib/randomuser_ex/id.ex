defmodule RandomuserEx.Id do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:name, :value]
end
