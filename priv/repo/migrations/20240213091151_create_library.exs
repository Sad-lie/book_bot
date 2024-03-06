defmodule EpubApi.Repo.Migrations.CreateLibrary do
  use Ecto.Migration

  def change do
    create table(:library) do
      add :total_parse, :integer
      add :user_id, references(:user, on_delete: :nothing)
      add :book_id, references(:book, on_delete: :nothing)
      add :timestamp, :naive_datetime
    end
  end
end
