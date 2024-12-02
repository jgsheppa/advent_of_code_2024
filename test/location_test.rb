# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/location'
require_relative '../lib/file'

# Test program coolness
class HistoricLocationTest < Minitest::Test
  def test_total_distance_of_historic_locations
    lists = AdventFile.new('puzzle_input/day_one_example.txt').read_locations
    total_distance = HistoricLocation.new(lists).total_distance
    assert_equal total_distance, 11
    refute_equal total_distance, 1
  end
end
