# frozen_string_literal: true

require_relative './lib/file'
require_relative './lib/report'

reports = AdventFile.new('puzzle_input/day_two/part_one_input.txt').read_reports
number_of_safe_reports = Report.new(reports).count_safe_reports_with_dampener
puts number_of_safe_reports
