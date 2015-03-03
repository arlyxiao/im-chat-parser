# ImChatParser

需求来源: https://github.com/mindpin/chatflow/issues/14

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'im-chat-parser'
```




## Usage

```ruby

require 'im_chat_parser'

chat = ImChatParser.load('文本文件绝对路径')

chat.lines.length

# Get all chat lines
lines = chat.lines

# Get each chat line user
user = chat.lines[0]
user.names
user.qq_num

# Get all chat users
users = chat.users
users[0].qq_num
users[0].names

```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/im-chat-parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
