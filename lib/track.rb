# frozen_string_literal: true

require_relative 'forenoon'
require_relative 'afternoon'
require_relative 'sorted_talks'
require_relative 'main_talks'
require_relative 'lightning_talks'

# :nodoc:
class Track
  attr_accessor :time_at_nine, :time_at_twelve, :time_at_one, :time_at_five
  attr_reader :normal_talks, :lightning_talks

  def initialize(normal_talks, lightning_talks)
    @time_at_nine = Forenoon.new.time_at_nine
    @time_at_twelve = Forenoon.new.time_at_twelve
    @time_at_one = Afternoon.new.time_at_one
    @time_at_five = Afternoon.new.time_at_five
    @normal_talks = normal_talks
    @lightning_talks = lightning_talks
  end

  def start
    remaining_talks = remaining_normal_talks normal_talks, time_at_nine, time_at_twelve
    remaining_lightning = remaining_lightning_talks lightning_talks, @@current_time, time_at_twelve
    remaining_talks_afternoon = remaining_normal_talks remaining_talks, time_at_one, time_at_five
    remaining_lightning_talks_afternoon = remaining_lightning_talks remaining_lightning, @@current_time, time_at_five
    [remaining_talks_afternoon, remaining_lightning_talks_afternoon]
  end

  private

  def remaining_normal_talks(talks, start_time, end_time)
    finished_talks = MainTalks.new.start_talking talks, start_time, end_time
    @@current_time = MainTalks.current_time
    talks - finished_talks
  end

  def remaining_lightning_talks(talks, start_time, end_time)
    finished_lightning_talks = LightningTalks.new.start_talking talks, start_time, end_time
    (talks.to_a - finished_lightning_talks.to_a).to_h
  end
end
