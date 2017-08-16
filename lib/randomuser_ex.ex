defmodule RandomuserEx do
  @moduledoc ~S"""
  Elixir wrapper to consume randomuser.me API.

  Just a simple wrapper for the randomuser.me API in order to make easy to get
  information to create random users in our applications.
  """

  alias RandomuserEx.{Id, Location, Login, Name, Picture, RandomUser}

  @doc ~S"""
  Fetch one random user generated by randomuser.me matching the options specified.

  ## Usage example

    iex(1)> {:ok, user} = RandomuserEx.get_one(%{gender: :male})
    iex(2)> !is_nil(user)
    true
  """
  def get_one(params \\ %{}) do
    case get_many(params) do
      {:ok, results} -> {:ok, List.first(results)}
      {:error, reason} -> {:error, reason}
    end
  end

  @doc ~S"""
  Fetch N random users generated by randomuser.me matching the options specified.

  ## Usage example

    iex(1)> {:ok, users} = RandomuserEx.get_many(%{nat: :es}, 20)
    iex(2)> length(users)
    20
    iex(3)> !is_nil(Enum.at(users, 0))
    true
  """
  def get_many(params \\ %{}, number \\ 1) do
    params =
      params
      |> Map.put(:results, number)
      |> Map.put(:format, :json)

    case fetch(params) do
      {:ok, results} -> {:ok, results["users"]}
      {:error, reason} -> {:error, reason}
    end
  end

  # Private functions
  defp fetch(params) do
    uri = "https://randomuser.me/api/?" <> URI.encode_query(params)

    case HTTPoison.get(uri) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Poison.decode(body) do
          {:ok, values} ->
            users = Enum.map(values["results"], fn (result) ->
              Poison.decode!(Poison.encode!(result), as: user_structure())
            end)

            {:ok, %{"users" => users}}
          {:error, reason} -> {:error, reason}
        end
      _ -> {:error, nil}
    end
  end

  defp user_structure do
    %RandomUser{
      id: %Id{}, location: %Location{}, login: %Login{},
      name: %Name{}, picture: %Picture{}
    }
  end
end
