require 'telegram/bot'
require_relative 'handlers/connector'

KEY = '5551767706:AAH7cRso9gXRaRNL-ByUVTuvtAsRLb4EG7M'

handlers_connector = Handlers::Connector.new.connect

Telegram::Bot::Client.run(KEY) do |bot|
  bot.listen do |message|
    handlers_connector.handle_all(message, bot)
  end
end
