defmodule EpubApi.RepoInt do
  alias EpubApi.Repo
  alias EpubApi.Schema.{Book, Library, User}

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def create_book(user_id, attrs) do
    %Book{}
    |> Book.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, get_user(user_id))
    |> Repo.insert()
  end

  def get_book(id) do
    Repo.get(Book, id)
end

  def create_library(user_id, book_id, attrs) do
    %Library{}
    |> Library.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, get_user(user_id))
    |> Ecto.Changeset.put_assoc(:book, get_book(book_id))
    |> Repo.insert()
  end

  def get_library(id) do
    Repo.get(Library, id)
  end

end
