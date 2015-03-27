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

        items = get_items_by_match_line(str)

        if items.nil?
          @line.text = @line.text.nil?? str: @line.text + "\n" + str
          @lines << @line
        else
          @line = Line.new

          @line.user = analyze_items(items)
        end
      end
      file.close

      @lines = @lines.uniq
      @users = @users.values.uniq

    end


    private

      def get_items_by_match_line(str)
        time_pattern = '\d{1,2}:\d{1,2}:\d{1,2}'

        first_pattern = /(?<name>[^\s]+)\s((?<other>.*)\s)*(?<time>#{time_pattern}$)/
        first_pattern.match(str)
      end


      def analyze_items(items)
        items = items.to_a.compact
        items.shift

        @line.time = items.last.strip
        @line.time = items[1].strip + " " + @line.time if items[1]
        user_str = items[0].strip

        qq_pattern = /(?<name>.*)\((?<qq_num>\d+)\)$/
        email_pattern = /(?<name>.*)\<(?<qq_num>[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4})\>$/
        
        user_pre_data = qq_pattern.match(user_str).nil?? email_pattern.match(user_str): qq_pattern.match(user_str)
        if user_pre_data
          user_pre_data = user_pre_data.to_a.compact
          user_pre_data.shift

          name = user_pre_data[0].strip
          qq_num = user_pre_data[1].strip
        else
          name = items.first.strip
        end

        
        build_user(qq_num, name)
      end


      def build_user(qq_num, name)
        val = qq_num.nil?? name: qq_num
        unless @users.key?(val)
          user = User.new(qq_num, name)
          @users[val] = user
          return @users[val]
        end
          
        @users[val].names << name
        @users[val].names = @users[val].names.uniq.reject { |c| c.empty? }
        @users[val]
      end


  end

end



