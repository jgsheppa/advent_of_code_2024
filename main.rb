# frozen_string_literal: true

require_relative './lib/file'
require_relative './lib/location'

location_lists = AdventFile.new('puzzle_input/day_one.txt').read_locations
answer = HistoricLocation.new(location_lists).total_distance
puts answer
