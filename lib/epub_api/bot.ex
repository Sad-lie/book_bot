defmodule EpubApi.Bot do
  @bot :epub_api
    alias HTTPoison
    use ExGram.Bot,
      name: @bot,
      setup_commands: true
    # use Tesla
    # plug Tesla.Middleware.BaseUrl, ""
    # alias ExGram.Model.Message
    command("start")
    command("help", description: "Print the bot's help")
    command("list", description: "List of all books ")
    command("book", description: "details about the book")
    command("chapter", description: "All the cahpters in the book")
    command("/echo", description: "Meow is the list")
    #commands("books")
    #button(text, opts \\ [])
    #keyboard(which_keyboard, list)
    #row(list)

    middleware(ExGram.Middleware.IgnoreUsername)

    def bot(), do: @bot

    def me(), do: ExGram.get_me(bot: bot())


    # def handle({:command, :start, msg}, context) do
    #   buttons = [
    #     [create_button("List Books", "list_books")],
    #     [create_button("Help", "help")],
    #     [create_button("Set Interval", "set_interval")]
    #   ]

    #   keyboard = create_keyboard(buttons)

    #   answer(context,
    #     "Welcome! Choose an option:",
    #     reply_markup: keyboard
    #   )
    # end
    def handle_update(%{message: %{text: "/echo " <> text, chat: %{id: chat_id}}}=update, _context) do
      # Send back (echo) the text that comes after the /echo command
      ExGram.send_message(chat_id, text)
    end
    def handle({:command, :start, _msg}, context) do
      answer(context,
      """
      Hey...Sabeel! , its Noui here, am a bot, you can upload any book in epub formant and set a timer , i will parse it and send u in the intervel,
      upload the file with text /book , here ... the default will be set to 60 mins intervel , use /intravel to change the intravel
      """
      )
    end

    def handle({:command, :help, _msg}, context) do
      answer(context, "Here is your help:")
    end

    # def handle({:command, :list ,_msg}, context) do
    #   {:ok, me} = me()
    #   books = EpubApi.RepoInt.get_books(me.user_id)
    #     new = Enum.each(books,fn books -> "Book is #{titile}, Chapter is #{chapter} and #{active_parse}"end )
    #   answer(context,
    #   """
    #     Here is the list :
    #      #{new}

    #   """
    #   )
    # end

    def handle({:command, :chapter ,_msg}, context) do
      answer(context, "Here is your list")
    end

    # def handle(
    #   {:command, :get_file, %{chat: %{id: chat_id}, from: %{id: user_id}, file: file_info}},context) do
    #     Logger.info("/get_file command from user [#{user_id}]")

    #       case store_file(user_id, file_info) do
    #         {:error, reason} ->
    #           answer(context, "Failed due to #{reason}")

    #         {:error, duplicate} ->
    #           answer(context,"File #{duplicate} already exist")

    #         {:ok, _} ->
    #           answer(context, "File added successfully  ")
    #       end
    #       ExGram.create_inline_botton()

    # end

    defp create_button(text, callback_data) do
      %{
        text: text,
        callback_data: callback_data
      }
    end

    defp create_keyboard(buttons) do
      %{keyboard: buttons, one_time_keyboard: true, resize_keyboard: true}
    end



  #   def send_message(chat_id, text) do
  #     token = "6572036459:AAHCV5wzjPtrq1nBzodbzhDpkROpZkHQrho"
  #     url = "https://api.telegram.org/bot#{token}/sendMessage"
  #     body = Poison.encode!(%{"chat_id" => chat_id, "text" => text})
  #     headers = ["Content-Type": "application/json"]
  #     HTTPoison.post(url, body, headers)
  # end
  # def handle_update(%Message{text: text} = message, _context) do
  #   ExGram.send_message(message.chat.id, "You said: #{text}")
  #   {:ok, _} = :timer.sleep(1000) # delay response for 1 second
  #   {:ok, []}
  # end
end
