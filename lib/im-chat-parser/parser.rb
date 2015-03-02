require './im-chat-parser/line'
require './im-chat-parser/user'


module ImChatParser

  class Parser

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

        email_pattern = /[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+/
        qq_pattern = /[1-9][0-9]{4,}/
        user_string = item[0][0..-9]

        email = user_string.match(email_pattern).to_s
        qq = user_string.match(qq_pattern).to_s

        # name = user_string.gsub(/[#{email}<>]/, '').gsub(/\([#{qq}\)]/, '').strip


        if email.empty?
          qq_num = qq
          # name = user_string.strip.gsub(/[\(#{qq}\)]?/, '')
          name = user_string.split(qq)[0][0..-2]

        elsif qq.empty?
          qq_num = email
          name = user_string.gsub(/[#{email}<>]/, '').strip
        end

        # p name
        # p user_string
        # p '==='
        # user.name = name

        if users.key?(qq_num)
          user = users[qq_num]
          user.names << name
          user.names = user.names.uniq
        else
          user = User.new(qq_num, name)
          users[qq_num] = user
        end
        

        line.user = user

        lines << line
      end

      # p lines

      @users = users
      @lines = lines
    end


  end

end



