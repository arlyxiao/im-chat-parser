require 'im-chat-parser/parser'

module ImChatParser

  def self.load(file_path)
    
    file = File.new(file_path, 'r')

    Parser.new(file)
    
  end

end