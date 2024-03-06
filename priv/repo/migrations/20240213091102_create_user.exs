defmodule EpubApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :timestamp, :naive_datetime
    end
  end
end
