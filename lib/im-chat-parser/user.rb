module ImChatParser


  class User

    attr_accessor :qq_num, :names

    def initialize(qq_num, name)
      self.qq_num = qq_num
      self.names = [name]
    end
    

  end


end