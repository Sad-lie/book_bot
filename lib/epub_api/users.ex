defmodule EpubApi.User do
  import Ecto.Query, warn: false
  alias EpubApi.Repo
  alias EpubApi.Schema.User

  def create_user(params) do
    %User{}
      |> Repo.insert(params)
  end
  def start do
    import Ecto.Query, warn: false
    alias EpubApi.Repo
    alias EpubApi.Schema.User

  params = %{
    name: "noews",
    timestamp: ~N[2023-03-25 12:30:00],

  }
   EpubApi.Schema.User.changeset(%EpubApi.Schema.User{}, params)
   |>  Repo.insert()
end
end
