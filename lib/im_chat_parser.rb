require './im-chat-parser/parser'

class ImChatParser

  def load(file_path)
    file = File.new("test.txt", "r")

    Parser.new(file)
  end

end