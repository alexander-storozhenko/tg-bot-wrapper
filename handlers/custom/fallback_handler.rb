require_relative '../handler'

module Handlers
  class FallbackHandler < Handler
    def self.handle(message, bot)
      bot.api.send_message(
        parse_mode: 'html',
        chat_id: message.chat.id,
        text: 'Something went wrong...'
      )
    end
  end
end

