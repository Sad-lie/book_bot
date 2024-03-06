defmodule EpubApi.Schema.Library do
  use Ecto.Schema
  import Ecto.Changeset

  schema "library" do
    field :total_parse, :integer
    field :timestamp, :naive_datetime
    belongs_to :user, EpubApi.Schema.User
    belongs_to :book, EpubApi.Schema.Book
  end

  def changeset(library, attrs) do
    library
    |> cast(attrs, [:total_parse, :user_id,  :timestamp]) #:book_id,
    #|> validate_required([:total_parse, :user_id, :book_id, :timestamp])
  end
end
