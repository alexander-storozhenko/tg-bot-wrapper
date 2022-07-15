require_relative 'validator'
module Handlers
  class Handler
    extend Validator
    include Singleton

    attr_accessor :message_type

    MESSAGE_TYPES = %i[text callback_query].freeze

    def self.handle(_message, _bot)
      nil
    end

    def self.message_type
      @message_type
    end

    def self.available_data
      @available_data
    end

    def self.message_type!(type)
      raise StandardError unless MESSAGE_TYPES.include? type

      @message_type = type
    end

    def self.available_data!(data = [])
      @available_data = data
    end

    def self.is_any?
      @available_data == :any || nil
    end

    def self.handle_with_validate?(message, bot)
      if valid_message?(message) && valid_available?(message)
        handle(message, bot)
        return true
      end

      false
    end
  end
end