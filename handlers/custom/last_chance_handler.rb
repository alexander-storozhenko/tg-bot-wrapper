require_relative '../handler'

module Handlers
  class LastChanceHandler < Handler
    message_type! :text
    available_data! :any

    def self.handle(message, bot)
      bot.api.send_message(
        parse_mode: 'html',
        chat_id: message.chat.id,
        text: 'I do not understand you...'
      )
    end
  end
end


