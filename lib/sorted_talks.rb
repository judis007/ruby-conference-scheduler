# frozen_string_literal: true

require_relative 'talks'

# :nodoc:
class SortedTalks
  attr_accessor :duration_hash, :title_hash, :sorted_duration_keys

  def initialize
    @talks = Talks::LIST
    @duration_hash = {}
    @title_hash = {}
    @sorted_duration_keys = []
    @normal_talks = []
    @lightning_talks = {}
  end

  def get_lightning_talks
    lightning_talks_hash
  end

  def get_normal_talks
    normal_talks_hash
  end

  private

  def durations
    @talks.each_with_index do |talk, index|
      duration_hash[index + 1] = talk[:duration]
    end
    duration_hash
  end

  def titles
    @talks.each_with_index do |talk, index|
      title_hash[index + 1] = talk[:title]
    end
    title_hash
  end

  def sorted_durations
    sorted = durations.sort_by { |_key, value| value }
    sorted.to_h
  end

  def duration_keys
    sorted_durations.each do |key, _value|
      sorted_duration_keys << key
    end
    sorted_duration_keys
  end

  def lightning_talks_hash
    duration_keys.each_with_index do |key, value|
      @lightning_talks[value + 1] = titles[key] if sorted_durations[key] == 5
    end
    @lightning_talks
  end

  def normal_talks_hash
    duration_keys.each_with_index do |key, _value|
      @normal_talks << { title: titles[key], duration: durations[key] } if sorted_durations[key] != 5
    end
    @normal_talks
  end
end
