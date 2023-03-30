# Food Trucks

This application is built on the data from [sfgov](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data) to provide information about San Francisco food trucks and food carts.

## Software Versions

This project uses [asdf](https://asdf-vm.com/) to manage Elixir, Erlang, and Node.js versions. After installing it, use `asdf install` from the root of this project.

## External Dependencies

- [Postgres](https://www.postgresql.org/)
- [Postgres PostGIS](https://postgis.net/)
  Note: for Mac users it's easiest to just run `brew install postgis`

## Environmenet Variables

- `GOOGLE_API_KEY` - a Google API key with access to "Maps JavaScript API" API

## Setup

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
