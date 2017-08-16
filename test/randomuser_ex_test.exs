defmodule RandomuserExTest do
  use ExUnit.Case

  doctest RandomuserEx

  test "get_one/1 with some params returns one random user" do
    {:ok, user} = RandomuserEx.get_one(%{gender: :female})

    assert !is_nil(user)
  end

  test "get_many/2 with some params returns 10 random users" do
    {:ok, users} = RandomuserEx.get_many(%{gender: :male}, 10)

    assert !is_nil(users)
    assert length(users) == 10
  end
end
