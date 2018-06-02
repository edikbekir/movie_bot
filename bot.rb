require_relative 'config/environment'
require 'telegram/bot'

TOKEN = '####MY_TOKEN'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      start_question = "Select Year or Genre film"
      answers =
      Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [%w(Genre), %w(Year)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: start_question, reply_markup: answers)
    end
  end
end
