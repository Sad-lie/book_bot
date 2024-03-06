
defmodule EpubApiWeb.BookController do
  use EpubApiWeb, :controller
  alias EpubApi.Repo
  alias EpubApi.Schema.Book
  alias EpubApiWeb.BookComponent

  action_fallback EpubApiWeb.FallbackController


  def index(conn, _params) do
    books = Repo.all(Book)
    books_json = Enum.map(books, &BookComponent.render("book.json", book: &1))
    json(conn, %{data: books_json})
  end
  def show(conn, %{"id" => id}) do
    book = Repo.get(Book, id)
    render(conn, "show.html", book: book)
  end

  def new(conn, _params) do
    changeset = Book.changeset(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    changeset = Book.changeset(%Book{}, book_params)

    case Repo.insert(changeset) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    book = Repo.get(Book, id)
    changeset = Book.changeset(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Repo.get(Book, id)
    changeset = Book.changeset(book, book_params)

    case Repo.update(changeset) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Repo.get(Book, id)
    {:ok, _book} = Repo.delete(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
