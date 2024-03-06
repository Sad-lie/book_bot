defmodule EpubApiWeb.Pro do
  def process(html) do
    Enum.map(html, &extract_p/1)
  end

  defp extract_p({"p", _, content}) do
    Enum.map(content, &extract_text/1) |> Enum.join(" ")
  end
  defp extract_p(_), do: nil

  defp extract_text({_, _, c}) when is_list(c), do: Enum.map(c, &extract_text/1) |> Enum.join(" ")
  defp extract_text(text) when is_binary(text), do: text
  def titler(html) do
    case html do
      [{"title", _, [title_text]}] -> title_text
      _ -> nil
    end
  end
end
