defmodule EpubApi.Book do
  import Ecto.Query, warn: false
  alias EpubApi.Repo
  alias EpubApi.Schema.Book

  def create_book(params) do
    %Book{}
      |> Repo.insert(params)
  end
end
