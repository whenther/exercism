module BookKeeping
  VERSION = 1
end

module Enumerable
  def accumulate
    # return accumulator if no block.
    return each unless block_given?

    output = []

    each do |n|
      output.push(yield(n))
    end

    output
  end
end
