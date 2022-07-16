# tg-bot-wrapper

## Usage
firstly set in variable `KEY` your bot token in `main.rb`

add your handler in `handlers/custom` directory

```ruby

require_relative '../handler'

module Handlers
  class MyAwesomeHandler < Handler
    message_type! :text
    available_data! :any

    def self.handle(message, bot)
      bot.api.send_message(
        parse_mode: 'html',
        chat_id: message.chat.id,
        text: 'I'm works!'
      )
    end
  end
end

```
handle only messages "hello", "hi"
```ruby

require_relative '../handler'

module Handlers
  class HelloHandler < Handler
    message_type! :text
    available_data! ['hello', 'hi']

    def self.handle(message, bot)
      bot.api.send_message(
        parse_mode: 'html',
        chat_id: message.chat.id,
        text: 'Hi!'
      )
    end
  end
end

```
handle click on inline button

```ruby

require_relative '../handler'

module Handlers
  class BtnHandler < Handler
    message_type! :callback_query
    available_data! ['create_smth']

    def self.handle(message, bot)
      bot.api.send_message(
        parse_mode: 'html',
        chat_id: message.chat.id,
        text: 'Click on btn!'
      )
    end
  end
end

```
