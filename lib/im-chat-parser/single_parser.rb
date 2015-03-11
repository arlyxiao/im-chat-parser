require 'im-chat-parser/line'
require 'im-chat-parser/user'


module ImChatParser

  class SingleParser

    attr_accessor :text, :time, :user, :name, :lines, :users

    def initialize(file)
      data_lines = build_data_lines(file)

      # p data_lines

      build_chat(data_lines)
    end


    def build_data_lines(file)
      pattern = /[\s+【\u4E00-\u9FA5\w\d+】\u4E00-\u9FA5(\d+)\<w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*\>]+[\s]+[\d{1,}:\d{1,}:\d{1,}]{1,}$/
      data = {}

      while (line = file.gets)
        line = line.strip
        # next if line.empty?

        item = line.scan(pattern)

        if item.length > 0
          key = item[0]
          data[key] = []
        else
          data[key] << line if key
        end


      end
      file.close

      data
    end


    def build_chat(data_lines)
      users = {}
      lines = []
      line = {}
      data_lines.each do |item|
        line = Line.new
        

        line.text = item[1].reject { |c| c.empty? }.join('\n')
        line.time = item[0][-8..-1]
        name = item[0][0..-9].strip


        if users.key?(name)
          user = users[name]
          user.names << name
          user.names = user.names.uniq
        else
          user = User.new(nil, name)
          users[name] = user
        end

        # user = User.new(nil, name)        
        line.user = user



        lines << line
      end

      # p lines

      @users = lines.map {|line| line.user }.uniq
      @lines = lines
    end


  end

end



