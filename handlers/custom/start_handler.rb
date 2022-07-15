require_relative '../handler'
require_relative '../../helpers/keyboard_helper'

module Handlers
  class StartHandler < Handler
    extend KeyboardHelper

    message_type! :text
    available_data! ['/start']

    def self.handle(message, bot)
      bot.api.send_message(
        chat_id: message.chat.id,
        parse_mode: 'html',
        text: 'Hello!',
        reply_markup: Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: ["test btn"],
          one_time_keyboard: true,
          resize_keyboard: true
        )
      )
    end
  end
end

