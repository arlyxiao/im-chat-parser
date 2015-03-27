require 'spec_helper'

describe 'test parse' do

  before {
    @path = File.expand_path('../../test_files', __FILE__) 
  }

  describe 'multiple' do
    before {
      @chat = ImChatParser.load(@path + "/multiple.text")
    }

    it 'lines' do
      expect(@chat.lines.length).to eq(6)
    end

    it 'users' do
      expect(@chat.users.length).to eq(5)
    end

    it 'line -> user -> qq_num' do
      expect(@chat.lines[1].user.qq_num).to eq('21929307')
    end

    it 'line -> user -> qq_num' do
      expect(@chat.lines[2].user.qq_num).to eq('1159602464')
    end

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['李飞21', '【br】李飞'])
    end

    it 'line -> user -> names' do
      expect(@chat.lines[0].user.names).to eq([''])
    end

    it 'line -> user -> names' do
      expect(@chat.lines.last.user.names).to eq(['李飞21', '【br】李飞'])
    end

  end



  describe 'multiple2' do
    before {
      @chat = ImChatParser.load(@path + "/multiple2.text")
    }

    it 'lines' do
      # @chat.lines.each do |line|
      #   p line
      #   p '===='
      # end
      expect(@chat.lines.length).to eq(5)
    end

    it 'users' do
      expect(@chat.users.length).to eq(5)

      # @chat.users.each do |user|
      #   p user
      #   p '===='
      # end
    end

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['【话唠】′水月。'])
    end


  end


  describe 'multiple3' do
    before {
      @chat = ImChatParser.load(@path + "/multiple3.text")
    }

    it 'lines' do
      # @chat.lines.each do |line|
      #   p line
      #   p '===='
      # end
      expect(@chat.lines.length).to eq(3)
    end

    it 'users' do
      expect(@chat.users.length).to eq(2)

      # @chat.users.each do |user|
      #   p user
      #   p '===='
      # end
    end

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['【活跃】殇康', '殇康2'])
    end


  end



  describe 'single' do
    before {
      @chat = ImChatParser.load(@path + "/single.text")
    }

    it 'lines' do
      expect(@chat.lines.length).to eq(4)
    end

    it 'users' do
      expect(@chat.users.length).to eq(2)
    end

    it 'line -> user -> qq_num' do
      expect(@chat.lines[1].user.qq_num).to eq(nil)
    end

    it 'line -> user -> names' do
      expect(@chat.lines[0].user.names).to eq(['洋气书生'])
    end

  end


  describe 'single2' do
    before {
      @chat = ImChatParser.load(@path + "/single2.text")
    }

    it 'lines' do
      # @chat.lines.each do |line|
      #   p line
      #   p '===='
      # end
      expect(@chat.lines.length).to eq(8)
    end

    it 'users' do
      expect(@chat.users.length).to eq(2)
    end

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['负伤de骑士'])
    end

  end


  describe 'single3' do
    before {
      @chat = ImChatParser.load(@path + "/single3.text")
    }

    it 'lines' do
      expect(@chat.lines.length).to eq(3)
    end

    it 'users' do
      expect(@chat.users.length).to eq(2)
    end

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['洋气书生'])
    end

    it 'line -> user -> time' do
      expect(@chat.lines[2].time).to eq('2015/3/23 星期一 16:05:58')
    end

  end



  describe 'error' do
    before {
      # @chat = ImChatParser.load(@path + "/error.text")
    }

    it 'lines' do
      # expect(@chat.lines.length).to eq(0)
    end


  end

  

end