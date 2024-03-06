defmodule EpubApiWeb.TelegramController do
  use EpubApiWeb, :controller
  alias EpubApiWeb.Epub
 #

  def update(conn, %{"token" => token} = params) do
    # Verify that the token matches your bot's token
    if token == Application.get_env(:my_app, :telegram_bot_token) do
      {:ok, body, _} = Plug.Conn.read_body(conn)
      _update = Poison.decode!(body)

      # Handle the update here...
      # This could involve reading an EPUB book, splitting it into segments,
      # and sending these segments back to the user.

      # For example:
      epub_data = Epub.epub_ext()
      _title = epub_data["title"]
      _paragraphs = epub_data["paragraph"]

      # You would then send `title` and `paragraphs` back to the user.

      send_resp(conn, 200, "")
    else
      send_resp(conn, 403, "Forbidden")
    end
  end
end
