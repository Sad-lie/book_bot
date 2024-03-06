defmodule EpubApiWeb.BookComponent do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
    <%= for book <- @books do %>
      <div>
        <p><%= book.title %></p>
        <p><%= book.author %></p>
        <p><%= book.active_parse %></p>
        <p><%= book.user_id %></p>
        <p><%= book.timestamp %></p>
      </div>
    <% end %>
    """
  end
end
