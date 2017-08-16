defmodule RandomuserEx.Name do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:first, :last, :title]
end
