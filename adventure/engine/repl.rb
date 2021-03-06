module Adventure
  module Engine
    module Repl
      private
      COMMAND_PREFIX = '> '
      QUIT_COMMANDS = [':q', 'quit', 'exit', 'bugger off, mate!']

      def read
        print COMMAND_PREFIX
        @last_command = gets.chomp
      end

      def eval(command)
        'Oh I see...'
      end

      def do_print(output)
        puts output
      end

      def done?
        QUIT_COMMANDS.include? @last_command.downcase
      end

      public
      def start
        greet
        loop do
          do_print eval read
          break if done?
        end
      end
    end
  end
end
