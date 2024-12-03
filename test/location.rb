# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/location'
require_relative '../lib/file'

# Test program coolness
class HistoricLocationTest < Minitest::Test
  def test_total_distance_of_historic_locations
    lists = AdventFile.new('puzzle_input/day_one_example.txt').read_locations
    total_distance = HistoricLocation.new(lists).total_distance
    assert_equal total_distance.answer, 11
    refute_equal total_distance.answer, 1
  end

  def test_similarity_score
    lists = AdventFile.new('puzzle_input/day_one_part_two_example.txt').read_locations
    total_distance = HistoricLocation.new(lists).similarity_score
    assert_equal total_distance.answer, 31
    refute_equal total_distance.answer, 11
  end
end
