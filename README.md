# FoodTruck

Installation:
  * Install Elixir `1.16.2` and Erlang `26.1` using `Asdf` or preferred method
  * Install Postgres `16.2` using `Asdf` or preferred method (No local docker created yet...)
  * Add a new file `config/dev.secrets.exs` and add the following:

    ```
    import Config

    config :food_truck, :google_maps_api_key, "<GOOGLE MAPS API KEY HERE>"
    ```
  * Run `mix setup` to install and setup dependencies


To start your Phoenix server:

  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`https://food-truck.localhost:4001`](https://food-truck.localhost:4001) from your browser.

Ready to run in production?
  * Install the Gigalixir CLI by following https://www.gigalixir.com/docs/getting-started-guide/
  * See https://estee-lauder.gigalixirapp.com for example deployment

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
