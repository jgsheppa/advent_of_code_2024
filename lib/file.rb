# frozen_string_literal: true

# AdventFile handles the file input for AOC's puzzle inputs
class AdventFile
  def initialize(filepath)
    @filepath = filepath
  end

  def read_locations
    lines = File.read(@filepath).split

    left = []
    right = []

    lines.each.with_index do |line, index|
      if index.even?
        left.push(line.to_i)
      else
        right.push(line.to_i)
      end
    end

    [left, right]
  end
end
