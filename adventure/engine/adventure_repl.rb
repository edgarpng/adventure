require_relative 'repl'
require_relative '../model/scenario_factory'
require 'pry'

module Adventure
  module Engine
    class AdventureRepl
    include Repl

      def initialize
        @scenario = Model::ScenarioFactory.from_resource('resources/story.txt')
      end

      def eval(command)
        next_scenario = @scenario.choose command
        if next_scenario
          @scenario = next_scenario
          @scenario.description
        else
          command_not_found_message
        end
      end

      def greet
        do_print @scenario.description
      end

      def done?
        @scenario.last?
      end

      private
      def command_not_found_message
        "Sorry, I don't understand"
      end
    end
  end
end
