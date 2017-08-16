defmodule RandomuserEx.Login do
  @moduledoc false

  @derive [Poison.Encoder]

  @type t :: %__MODULE__{}

  defstruct [:md5, :password, :salt, :sha1, :sha256, :username]
end
