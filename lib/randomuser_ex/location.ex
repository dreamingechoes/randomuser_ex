defmodule RandomuserEx.Location do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:city, :postcode, :state, :street]
end
