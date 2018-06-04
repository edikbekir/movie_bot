require_relative 'config/environment'
require 'telegram/bot'
require_relative 'lib/parser.rb'
require_relative 'models/genre.rb'
require_relative 'models/film.rb'

TOKEN = '#'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      start_question = "Select by year or genre"
      answers =
      Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [%w(Genre), %w(Year)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: start_question, reply_markup: answers)
    when "Genre"
        question = "Select genre"
        arr = []
        Genre.all.each {|g|  arr << g.genre}
        genres = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: arr)
        bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: genres, resize_keyboard: true)
    end
  end
end
