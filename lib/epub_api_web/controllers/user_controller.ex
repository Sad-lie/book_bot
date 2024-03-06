defmodule EpubApiWeb.UserController do
  use EpubApiWeb, :controller
  alias EpubApi.Repo


  alias EpubApi.Schema.User

  action_fallback EpubApiWeb.FallbackController

  def index(conn, _params) do
    users  = Repo.all(User)
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accouts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accouts.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accouts.get_user!(id)

    with {:ok, %User{} = user} <- Accouts.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accouts.get_user!(id)

    with {:ok, %User{}} <- Accouts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
