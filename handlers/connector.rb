# frozen_string_literal: true

module Handlers
  class Connector

    attr_accessor :handlers

    def initialize
      @handlers = []
    end

    def connect
      require_handlers.each do |h|
        @handlers << Object.const_get("Handlers::#{h}")
      end

      self
    end

    def handle_all(message, bot)
      any = @handlers.reject(&:is_any?) + @handlers.select(&:is_any?)
      any.each { |h| h.handle_with_validate?(message, bot) && break }

    rescue StandardError
      Handlers::FallbackHandler.handle(message, bot)
    end

    private

    REQUIRES_PATH = 'custom'

    def require_handlers
      Dir["handlers/#{REQUIRES_PATH}/*"].map do |path|
        require_relative "#{REQUIRES_PATH}/#{File.basename(path.split('/').drop(1).last, '.rb')}"
        File.basename(path, '.rb').split('_').map(&:capitalize).join
      end
    end
  end
end
