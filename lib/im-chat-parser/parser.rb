require 'im-chat-parser/line'
require 'im-chat-parser/user'


module ImChatParser

  class Parser

    attr_accessor :text, :time, :user, :name, :lines, :users

    def initialize(file)
      build_data_lines(file)
    end


    def build_data_lines(file)
      @users = {}
      @lines = []

      while (str = file.gets)
        str = str.strip
        next if str.empty?

        items = match_str(str)

        if items.nil?
          @line.text = @line.text.nil?? str: @line.text + "\n" + str
          @lines << @line
        else
          @line = Line.new

          items = items.to_a.compact
          items.shift

          @line.user = build_user(items)
        end
      end
      file.close

      @lines = @lines.uniq
      @users = @users.values

    end


    private

      def match_str(str)
        # pattern = /[\s+【\u4E00-\u9FA5\w\d+】\u4E00-\u9FA5(\d+)\<w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*\>]+[\s]+[\d{1,}:\d{1,}:\d{1,}]{1,}$/
        time_pattern = '[\d{1,}:\d{1,}:\d{1,}]{1,}'
        email_pattern = '[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}'
        multiple_pattern = /^((?<name>.*)\((?<qq_num>\d+)\)|(?<name>.*)\<(?<qq_num>#{email_pattern})\>)\s+(?<time>#{time_pattern})$/
        single_pattern = /^(?<name>.*)\s+(?<time>#{time_pattern})$/

        last_char = str[0..-9].strip[-1]
        return multiple_pattern.match(str) if ['>', ')'].include? last_char
        single_pattern.match(str)
      end

      def build_user(items)
        name, qq_num, time = nil, nil, nil
        
        if items.length == 2
          name, @line.time = items[0].strip, items[1].strip
        else
          name, qq_num, @line.time = items[0].strip, items[1].strip, items[2].strip
        end

        val = qq_num.nil?? name: qq_num
        unless @users.key?(val)
          user = User.new(qq_num, name)
          @users[val] = user
          return @users[val]
        end
          
        @users[val].names << name
        @users[val].names = @users[val].names.uniq
        @users[val]
      end


  end

end



