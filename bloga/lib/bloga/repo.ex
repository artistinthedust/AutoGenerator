defmodule Bloga.Repo do
  use Ecto.Repo,
    otp_app: :bloga,
    adapter: Ecto.Adapters.Postgres
end
