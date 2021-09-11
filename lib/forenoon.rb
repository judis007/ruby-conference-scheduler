# frozen_string_literal: true

# :nodoc:
class Forenoon
  attr_accessor :time_at_nine, :time_at_twelve

  def initialize
    now = Time.now
    @time_at_nine = Time.new(now.year, now.month, now.day, 9, 0o0, 0, '+05:30')
    @time_at_twelve = Time.new(now.year, now.month, now.day, 12, 0o0, 0, '+05:30')
  end
end
