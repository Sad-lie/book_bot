defmodule EpubApi.Repo.Migrations.AddUserAssoc do
  use Ecto.Migration

  def change do
    alter table(:library) do
      add :user_id, references(:user, on_delete: :nothing)
    end
  end
end
