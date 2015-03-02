# Im::Chat::Parser

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'im-chat-parser'
```




## Usage

```ruby

require 'im_chat_parser'

chat = ImChatParser.load('./test.text')

chat.lines.length

lines = chat.lines
users = chat.users


```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/im-chat-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
