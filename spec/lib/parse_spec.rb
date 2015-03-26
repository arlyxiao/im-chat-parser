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

    it 'line -> user -> names' do
      expect(@chat.lines[1].user.names).to eq(['李飞21', '【br】李飞'])
    end

    it 'line -> user -> names' do
      expect(@chat.lines.last.user.names).to eq(['李飞21', '【br】李飞'])
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


  describe 'single' do
    before {
      @chat = ImChatParser.load(@path + "/multiple2.text")
    }

    it 'lines' do
      @chat.lines.each do |line|
        p line
        p '===='
      end
      # expect(@chat.lines.length).to eq(6)
    end

    # it 'users' do
    #   expect(@chat.users.length).to eq(5)
    # end

    # it 'line -> user -> qq_num' do
    #   expect(@chat.lines[1].user.qq_num).to eq('108198236')
    # end


  end

  

end