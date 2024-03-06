defmodule EpubApiWeb.ErrorJSONTest do
  use EpubApiWeb.ConnCase, async: true

  test "renders 404" do
    assert EpubApiWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert EpubApiWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
