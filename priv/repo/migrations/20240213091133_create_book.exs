defmodule EpubApi.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book) do
      add :title, :string
      add :author, :string
      add :active_parse, :integer
      add :user_id, references(:user, on_delete: :nothing)
      add :timestamp, :naive_datetime
    end
  end
end
