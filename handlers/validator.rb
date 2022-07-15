module Handlers
  module Validator
    def valid_available?(message)
      return false unless [
        Telegram::Bot::Types::CallbackQuery,
        Telegram::Bot::Types::Message
      ].include?(message.class)

      @available_data ||= :any

      available = @available_data.is_a?(Hash) ? @available_data.values : @available_data

      return available == :any || available.include?(message.data) if @message_type == :callback_query
      return available == :any || available.include?(message.text) if @message_type == :text

      false
    end

    def valid_message?(message)
      return false if (message.is_a?(Telegram::Bot::Types::CallbackQuery) && @message_type != :callback_query) ||
        (message.is_a?(Telegram::Bot::Types::Message) && @message_type != :text)

      true
    end
  end
end
