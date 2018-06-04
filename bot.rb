require_relative 'config/environment'
require 'telegram_bot'

class Main
  attr_reader :telegram_bot
  private     :telegram_bot

  def initialize(telegram_object)
    @telegram_object = telegram_object
  end

  def self.update(telegram_object)
    telegram_object.get_updates(fail_silently: true) do |m|
      messages(m, telegram_object)
    end
  end

  def self.messages(message, telegram_object)
    command = message.get_command_for(telegram_object)
    commands(command)
  end

  def self.commands(command)
    puts "Hi"
  end
end

main = Main.update(TelegramBot.new(token: ENV['TOKEN']))
