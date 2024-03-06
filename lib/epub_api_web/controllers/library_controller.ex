
defmodule EpubApiWeb.LibraryController do
  use EpubApiWeb, :controller
  alias EpubApi.Repo

  alias EpubApi.Schema.Library

  action_fallback EpubApiWeb.FallbackController

  def index(conn, _params) do
    librarys = Repo.all(Library)
    render(conn, "index.html", librarys: librarys)
  end

  def show(conn, %{"id" => id}) do
    library = Repo.get(Library, id)
    render(conn, "show.html", library: library)
  end

  def new(conn, _params) do
    changeset = Library.changeset(%Library{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"library" => library_params}) do
    changeset = Library.changeset(%Library{}, library_params)

    case Repo.insert(changeset) do
      {:ok, _library} ->
        conn
        |> put_flash(:info, "library created successfully.")
        |> redirect(to: Routes.library_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    library = Repo.get(Library, id)
    changeset = Library.changeset(library)
    render(conn, "edit.html", library: library, changeset: changeset)
  end

  def update(conn, %{"id" => id, "library" => library_params}) do
    library = Repo.get(Library, id)
    changeset = library.changeset(library, library_params)

    case Repo.update(changeset) do
      {:ok, _library} ->
        conn
        |> put_flash(:info, "library updated successfully.")
        |> redirect(to: Routes.library_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", library: library, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    library = Repo.get(Library, id)
    {:ok, _library} = Repo.delete(library)

    conn
    |> put_flash(:info, "library deleted successfully.")
    |> redirect(to: Routes.library_path(conn, :index))
  end
end
