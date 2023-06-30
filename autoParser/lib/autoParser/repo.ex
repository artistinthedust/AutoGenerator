defmodule AutoParser.Repo do
  use Ecto.Repo,
    otp_app: :autoParser,
    adapter: Ecto.Adapters.Postgres
end
