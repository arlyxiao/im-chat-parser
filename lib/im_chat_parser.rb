require './im-chat-parser/parser'

class ImChatParser

  def self.load(file_path)
    file = File.new(file_path, 'r')

    Parser.new(file)
  end

end