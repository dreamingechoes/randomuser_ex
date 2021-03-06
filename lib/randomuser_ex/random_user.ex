defmodule RandomuserEx.RandomUser do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:gender, :name, :location, :email, :login,
             :registered, :phone, :cell, :id, :picture, :nat]
end
