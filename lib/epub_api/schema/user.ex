defmodule EpubApi.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :timestamp, :naive_datetime
    has_many :books, EpubApi.Schema.Book
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :timestamp])
    #|> validate_required([:name, :timestamp])
  end
end
