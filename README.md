# RandomuserEx

Elixir wrapper to consume [randomuser.me](https://randomuser.me) API. This is just a way to make easier the use of this service in your Phoenix applications, all the credits of the development of the service are of their creators.

You can see the complete documentation of the API [here](https://randomuser.me/documentation).

## Installation

Add ``randomuser_ex`` to your dependencies in your ``mix.exs``:

```elixir
defp deps do
  [
    {:randomuser_ex, "~> 0.1.0"}
  ]
end
```

and run `mix deps.get`.

## Usage

There's two main functions which we'll use in order to get some random users from the API. This two functions will return:

* `{:ok, user(s)}`: in case of sucess.
* `{:error, reason}`: in case of error.

### RandomuserEx.get_one/1

This will allow us to get just one random user matching the options specified in the params. For example:

```elixir
iex(1)> {:ok, user} = RandomuserEx.get_one(%{gender: :male})
iex(2)> user.name
%RandomuserEx.Name{first: "frederikke", last: "hansen", title: "mr"}
iex(3)> user.name.last
"hansen"
```

### RandomuserEx.get_many/2

This will allow us to get N random users matching the options specified in the params. For example:

```elixir
iex(1)> {:ok, users} = RandomuserEx.get_many(%{nat: :es}, 20)
iex(2)> length(users)
20
iex(3)> Enum.at(users, 0)
%RandomuserEx.RandomUser{cell: "653-661-792", email: "juan.serrano@example.com",
gender: "male", ...}
```

Here you have a list of some options that you can use to get random users:

| param | description | values |
|---|---|---|
| :gender | The gender of the user(s)  | `:male` or `female` |
| :password | Format of the password generated for the user(s) | string of combinations of `upper`, `lower`, `special` and number. E.g: "upper,special,1-8" |
| :nat | Nationality of the user(s) by the ISO code | `:au`, `:br`, `:ca`, `:ch`, `:de`, `:dk`, `:es`, `:fi`, `:fr`, `:gb`, `:ie`, `:ir`, `:nl`, `:nz`, `:tr`, `:us` |

You can find the complete list of options [here](https://randomuser.me/documentation).

You can see the documentation of the package on the [hexdocs website](http://hexdocs.pm/randomuser_ex/0.1.0/).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dreamingechoes/randomuser_ex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://contributor-covenant.org) code of conduct.

## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
