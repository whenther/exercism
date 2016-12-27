# Find the difference between the sum of the squares and the square of the sums
# of the first N natural numbers.

# The square of the sum of the first ten natural numbers is,

#     (1 + 2 + ... + 10)**2 = 55**2 = 3025

# The sum of the squares of the first ten natural numbers is,

#     1**2 + 2**2 + ... + 10**2 = 385

# Hence the difference between the square of the sum of the first
# ten natural numbers and the sum of the squares is 2640:

#     3025 - 385 = 2640

module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(n)
    @number = n
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def sum_of_squares
    return 0 if @number.zero?

    (1..@number).reduce do |sum, n|
      sum + n**2
    end
  end

  def square_of_sum
    return 0 if @number.zero?

    sum = (1..@number).reduce(:+)
    sum**2
  end
end
