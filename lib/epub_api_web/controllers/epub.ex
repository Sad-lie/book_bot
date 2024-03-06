defmodule EpubApiWeb.Epub do
  alias Floki
  def path ,do: "lib/OEBPS/GeographyofBli_body_split_002.html"

  def epub_unzip(file) do
    unfile = File.rename("#{file}","#{file}.epub" )
    _new = :zip.unzip("#{unfile}", destination: "extracted/#{file}")
   end

  def epub_ext do
    file_path = path()
    {:ok, read_files} = File.read(file_path) |> Io.inspect()

    res =  Floki.parse_document(read_files) |> tuple() |> Enum.at(1) |> elem(2) |> Enum.at(1) |> elem(2) |> Enum.at(0) |> elem(2) #|> IO.inspect()
    para =  Floki.find(res , "p.") |> EpubApiWeb.Pro.process()
    title =  Floki.find(res , "title") |> EpubApiWeb.Pro.titler()
    %{ "title" => title,"paragraph" => para}
  end
  def tuple({_x,y}) , do: y
  def lister(list) do
    Enum.map(list, fn [tuple] -> uple(tuple) end)
  end
  def uple({_x,[_y],[z]}) , do: z
  def ple(x), do: [x]
end
# defmodule FindXHTML do
#   def find_in_directory(path) do
#     File.ls!(path)
#     |> Enum.map(&File.stat!(Path.join(path, &1)))
#     |> Enum.each(fn
#       %File.Stat{type: :directory} = dir ->
#         find_in_directory(Path.join(path, dir.name))

#       %File.Stat{type: :regular, name: name} ->
#         if String.ends_with?(name, ".xhtml") do
#           IO.puts("Found XHTML file: #{Path.join(path, name)}")
#         end
#     end)
#   end
# end

# Usage example:
#FindXHTML.find_in_directory("/path/to/parent/directory")
