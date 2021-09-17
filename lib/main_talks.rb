# frozen_string_literal: true

require_relative 'integer'

# :nodoc:
class MainTalks
  attr_accessor :finished_events

  def initialize
    @finished_events = []
  end

  class << self
    def current_time
      @@current_time
    end
  end

  def start_talking(main_talks, current_time, ending_time)
    @@current_time = current_time
    main_talks.each do |talk|
      talk_duration = talk[:duration]
      if (@@current_time + talk_duration.minutes) <= ending_time
        puts "#{@@current_time.strftime('%I:%M %p')} #{talk[:title]}"
        @@current_time += talk_duration.minutes
        finished_events << talk
      end
      break unless (@@current_time + talk_duration.minutes) <= ending_time
    end
    finished_events
  end
end
