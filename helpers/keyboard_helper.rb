module KeyboardHelper
  def create_keyboard(config)
    Telegram::Bot::Types::InlineKeyboardMarkup.new(
      keyboard: inline_buttons(config[:inline_keyboard]).first
    )
  end

  def inline_buttons(inline_config)
    inline_config.map do |k|
      Telegram::Bot::Types::KeyboardButton.new(
        text: k[:text],
        callback_data: k[:callback_data],
        )
    end
  end
end
