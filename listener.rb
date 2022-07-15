require 'telegram/bot'

class Listener
  def self.catch_message(message, bot)
    case message
    when Telegram::Bot::Types::CallbackQuery
      p 'clbk'
    when Telegram::Bot::Types::Message

      bot.api.send_message(
        chat_id: message.chat.id,
        parse_mode: 'html',
        text: "ok",
        reply_markup: Telegram::Bot::Types::InlineKeyboardMarkup.new(
          inline_keyboard: [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Получить account', callback_data: 'get_account')
          ]
        )
      )

      bot.api.send_media_group(
        chat_id: message.chat.id,
        media: images.map.with_index do |img, index|
          Telegram::Bot::Types::InputMediaPhoto.new(media: img, caption: index == 0 ? text : '', parse_mode: '')
        end,
        )

    else
      p 'unknown'
    end
  end

  def inline_message(message, inline_markup, editless = false, chat_id = false)

    if editless
      return Listener.bot.api.edit_message_text(
        chat_id: chat_id,
        parse_mode: 'html',
        message_id: Listener.message.message.message_id,
        text: message,
        reply_markup: inline_markup
      )
    end
    Listener.bot.api.send_message(
      chat_id: chat_id,
      parse_mode: 'html',
      text: message,
      reply_markup: inline_markup
    )
  end
end
