require 'im-chat-parser/single_parser'
require 'im-chat-parser/multiple_parser'

module ImChatParser

  def self.load(file_path, type)
    
    file = File.new(file_path, 'r')

    case type
    when 'single'
      SingleParser.new(file)
    else
      MultipleParser.new(file)
    end
    
  end

end