module Adventure
  module Model
    class Scenario
      attr_reader :description

      def initialize(description)
        @choices = Hash.new
        @description = description
      end

      def add_action(action, scenario)
        @choices[action] = scenario
      end

      def choose(action)
        @choices[action]
      end

      def last?
        @choices.empty?
      end
    end
  end
end
