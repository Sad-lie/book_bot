defmodule EpubApi.AccoutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EpubApi.Accouts` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        Name: "some Name",
        email: unique_user_email()
      })
      |> EpubApi.Accouts.create_user()

    user
  end
end
