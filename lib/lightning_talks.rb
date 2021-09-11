# frozen_string_literal: true

require_relative 'integer'

# :nodoc:
class LightningTalks
  attr_accessor :finished_events

  def initialize
    @finished_events = []
  end

  def start_talking(lightning_talks, current_time, ending_time)
    if current_time < ending_time
      lightning_talks.each_with_index do |talk, _index|
        talk_duration = 5
        puts "#{current_time.strftime('%I:%M %p')} #{talk[1]}"
        finished_events << talk
        current_time += talk_duration.minutes
      end
    end
    finished_events.to_h
  end
end
