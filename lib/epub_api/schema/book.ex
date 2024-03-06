defmodule EpubApi.Schema.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book" do
    field :title, :string
    field :author, :string
    field :active_parse, :integer
    field :timestamp, :naive_datetime
    belongs_to :user, EpubApi.Schema.User
    has_one :library, EpubApi.Schema.Library
  end

  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :active_parse, :user_id, :timestamp])
    #|> validate_required([:title, :author, :active_parse, :user_id, :timestamp])
  end
end
