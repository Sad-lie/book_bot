defmodule EpubApi.Library do
  import Ecto.Query, warn: false
  alias EpubApi.Repo
  alias EpubApi.Schema.Library

  def create_library(params) do
    %Library{}
      |> Repo.insert(params)
  end
  def start do
    import Ecto.Query, warn: false
    alias EpubApi.Repo
    alias EpubApi.Schema.Library

  params = %{
    total_parse: 5,
    timestamp: ~N[2023-03-25 12:30:00],
    user_id: 1,
    book_id: 1
  }
   EpubApi.Schema.Library.changeset(%EpubApi.Schema.Library{}, params)
   |>  Repo.insert()
end
end
