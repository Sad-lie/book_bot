defmodule EpubApi do

end
defmodule EpubApi.Tessla do

  use Tesla
def start do
token = "Y6572036459:AAHCV5wzjPtrq1nBzodbzhDpkROpZkHQrho"

base_url = "https://api.telegram.org/bot#{token}/sendMessage"

client = Tesla.client([{Tesla.Middleware.BaseUrl, base_url}])


# Send message
response = client |> Tesla.post("/sendMessage", %{
  chat_id: 977236716,
  text: "Hello from my Elixir bot!"
})

# Handle response
case response do
  {:ok, %Tesla.Env{status: 200, body: body}} ->
    IO.inspect(body)
  {:ok, %Tesla.Env{status: status, body: body}} ->
    IO.inspect("Error: #{status} - #{body}")
  {:error, reason} ->
    IO.inspect("Network error")
    IO.inspect(reason)
end
end
end
defmodule EpubApi.Client do
  require Logger

  use Tesla

  @token "6572036459:AAHCV5wzjPtrq1nBzodbzhDpkROpZkHQrho"
  @base_url "https://api.telegram.org/"
  # Make sure this is your actual bot token
  @bot_url "#{@base_url}bot#{@token}/"

  # Set up Tesla client with base URL, headers, and middleware
  @client Tesla.client([
    {Tesla.Middleware.BaseUrl, @bot_url},
    Tesla.Middleware.JSON,
    {Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]},
    Tesla.Middleware.Logger
  ])

  @telegram_base_url "https://api.telegram.org/bot#{@token}/"

  @telegram_client(Tesla.client([{Tesla.Middleware.BaseUrl, @telegram_base_url}]))

  plug Tesla.Middleware.BaseUrl, @telegram_base_url

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json;   charset=utf-8"}
  ]

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Logger

  # def get_me() do
  #   case Tesla.get(@client, "getMe") do
  #     {:ok, %Tesla.Env{status: 200, body: body}} ->
  #       Logger.info("Get me details successfully retrieved")
  #       {:ok, body}

  #     {:ok, %Tesla.Env{status: status, body: body}} ->
  #       Logger.error("Failed to retrieve get me details", status: status, response: body)
  #       {:error, body}

  #     {:error, reason} ->
  #       Logger.error("Network error", reason: reason)
  #       {:error, reason}
  #   end
  # end
  def get_me() ,do: "/getme" |> get()
  def post_me() do
    "/getMessage" |> post([])
  end


end
