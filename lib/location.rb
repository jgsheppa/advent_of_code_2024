# frozen_string_literal: true

require_relative './file'
# Location represents the historically significant locations
# to be checked by the elves
class HistoricLocation
  def initialize(lists)
    first, last = lists
    @right_list = first.sort
    @left_list = last.sort
  end

  def total_distance
    distances = []
    @right_list.each.with_index do |location, index|
      if location > @left_list[index]
        distances.push(location - @left_list[index])
      else
        distances.push(@left_list[index] - location)
      end
    end
    distances.sum
  end
end
