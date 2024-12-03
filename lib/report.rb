# frozen_string_literal: true

# Report represents the elves' reports and is used
# to check the safety of the reports.
class Report
  def initialize(reports)
    @reports = reports
  end

  def count_safe_reports
    count = 0
    @reports.each do |report|
      count += 1 if safe?(report.split(' ').map(&:to_i))
    end
    count
  end

  def count_safe_reports_with_dampener
    count = 0
    @reports.each do |report|
      report_as_ints = report.split(' ').map(&:to_i)
      if safe?(report_as_ints)
        count += 1
      elsif safe_if_one_removed?(report_as_ints)
        count += 1
      end
    end
    count
  end

  def safe_if_one_removed?(report)
    problem_index = find_problem_index(report)
    report.delete_at(problem_index)

    safe?(report)
  end

  def find_problem_index(report)
    asc = true
    problem_index = 0
    report.each.with_index do |level, index|
      break if index == report.size - 1

      next_level = report[index + 1]
      asc = false if index.zero? && (level > next_level)
      level_diff = asc ? report[index + 1] - level : level - report[index + 1]
      if level_diff.negative?
        problem_index = index
        break
      end

      unless level_diff.between?(1, 3)
        problem_index = index
        break
      end

      if asc && (level > next_level)
        problem_index = index
      elsif !asc && (level < next_level)
        problem_index = index
      end
    end
    problem_index
  end

  def safe?(report)
    safe = false
    asc = true
    report.each.with_index do |level, index|
      break if index == report.size - 1

      next_level = report[index + 1]
      asc = false if index.zero? && (level > next_level)
      level_diff = asc ? report[index + 1] - level : level - report[index + 1]
      if level_diff.negative?
        safe = false
        break
      end

      unless level_diff.between?(1, 3)
        safe = false
        break
      end

      safe = if asc && (level < next_level)
               true
             elsif !asc && (level > next_level)
               true
             end
    end
    safe
  end
end
