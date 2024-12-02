# frozen_string_literal: true

require_relative './lib/file'
require_relative './lib/location'

location_lists = AdventFile.new('puzzle_input/day_one_part_two.txt').read_locations
answer = HistoricLocation.new(location_lists).similarity_score.answer
puts answer
