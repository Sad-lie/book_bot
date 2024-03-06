defmodule EpubApi.AccoutsTest do
  use EpubApi.DataCase

  alias EpubApi.Accouts

  describe "users" do
    alias EpubApi.Accouts.User

    import EpubApi.AccoutsFixtures

    @invalid_attrs %{Name: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accouts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accouts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{Name: "some Name", email: "some email"}

      assert {:ok, %User{} = user} = Accouts.create_user(valid_attrs)
      assert user.Name == "some Name"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accouts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{Name: "some updated Name", email: "some updated email"}

      assert {:ok, %User{} = user} = Accouts.update_user(user, update_attrs)
      assert user.Name == "some updated Name"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accouts.update_user(user, @invalid_attrs)
      assert user == Accouts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accouts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accouts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accouts.change_user(user)
    end
  end
end
