defmodule RandomuserExTest do
  use ExUnit.Case
  doctest RandomuserEx

  test "greets the world" do
    assert RandomuserEx.hello() == :world
  end
end
