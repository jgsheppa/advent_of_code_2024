# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/report'
require_relative '../lib/file'

# Test program coolness
class ReportTest < Minitest::Test
  def test_report_safety_desc
    reports = [5, 4, 3, 2, 1]
    safe = Report.new(reports).safe?(reports)
    assert_equal safe, true
  end

  def test_report_safety_asc
    reports = [1, 2, 3, 4, 5]
    safe = Report.new(reports).safe?(reports)
    assert_equal safe, true
  end

  def test_report_danger
    reports = [10, 5, 3, 2, 1]
    safe = Report.new(reports).safe?(reports)
    assert_equal safe, false
  end

  def test_unordered_report
    reports = [5, 4, 5, 3, 5]
    safe = Report.new(reports).safe?(reports)
    assert_equal safe, false
  end

  def test_safe_reports_count
    reports = ['5 4 3 2 1', '1 2 3 4 5', '5 3 5 3 5', '10 4 3 2 1']
    safe_reports = Report.new(reports).count_safe_reports
    assert_equal safe_reports, 2
  end

  def test_example_report
    reports = AdventFile.new('puzzle_input/day_two/part_one_example.txt').read_reports
    number_of_safe_reports = Report.new(reports).count_safe_reports
    assert_equal number_of_safe_reports, 2
  end

  def test_example_report_with_dampener
    reports = AdventFile.new('puzzle_input/day_two/part_one_example.txt').read_reports
    number_of_safe_reports = Report.new(reports).count_safe_reports_with_dampener
    assert_equal number_of_safe_reports, 4
  end
end
