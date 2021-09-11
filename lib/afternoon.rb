# frozen_string_literal: true

# :nodoc:
class Afternoon
  attr_accessor :time_at_one, :time_at_five

  def initialize
    now = Time.now
    @time_at_one = Time.new(now.year, now.month, now.day, 13, 0o0, 0, '+05:30')
    @time_at_five = Time.new(now.year, now.month, now.day, 17, 0o0, 0, '+05:30')
  end
end
