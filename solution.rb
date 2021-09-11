# frozen_string_literal: true

require_relative 'lib/forenoon'
require_relative 'lib/afternoon'
require_relative 'lib/sorted_talks'
require_relative 'lib/main_talks'
require_relative 'lib/lightning_talks'
require_relative 'lib/track'

# :nodoc:
class Solution
  attr_accessor :normal_talks, :lightning_talks

  def initialize
    @normal_talks = SortedTalks.new.get_normal_talks
    @lightning_talks = SortedTalks.new.get_lightning_talks
  end

  def start_conf
    puts 'Track 1'
    puts '-------'
    talks = Track.new(normal_talks, lightning_talks).start
    puts 'Track 2'
    puts '-------'
    remaining = Track.new(talks[0], talks[1]).start
    remaining_talks(remaining)
  end

  def remaining_talks(talks)
    talks.each do |talk|
      puts talk unless talk.empty?
    end
  end
end

Solution.new.start_conf
