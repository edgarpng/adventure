require_relative 'scenario'

module Adventure
  module Model
    class ScenarioFactory
      def self.from_resource(resource)
        text = File.open(resource).read
        scenarios = get_scenarios(text)
        current_scenario = nil

        text.each_line do |line|
          if scenario_line? line
            scenario_id = scenario_parts(line).first
            current_scenario = scenarios[scenario_id]
          else
            action, scenario_id = action_parts(line)
            next_scenario = scenarios[scenario_id]
            current_scenario.add_action(action, next_scenario)
          end
        end

        scenarios.first.last
      end

      def self.get_scenarios(text)
        scenarios = Hash.new
        text.each_line
          .select {|line| scenario_line? line}
          .map {|line| scenario_parts line}
          .each {|id, text| scenarios[id] = Scenario.new(text)}
        scenarios
      end

      def self.action_parts(line)
        line.split('->').map(&:strip)
      end

      def self.scenario_parts(line)
        line.split(':').map(&:strip)
      end

      def self.scenario_line?(line)
        line =~ /^\S+\:.+/
      end
    end
  end
end
