defmodule RandomuserEx.Picture do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:large, :medium, :thumbnail]
end
