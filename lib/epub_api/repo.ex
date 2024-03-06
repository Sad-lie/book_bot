defmodule EpubApi.Repo do
  use Ecto.Repo,
    otp_app: :epub_api,
    adapter: Ecto.Adapters.Postgres
end
