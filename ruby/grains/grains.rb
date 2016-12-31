# Write a program that calculates the number of grains of wheat on a chessboard given that the number on each square doubles.

module BookKeeping
  VERSION = 1
end

class Grains
  def self.square(n)
    2**(n - 1)
  end

  def self.total
    (1..64).reduce do |total, n|
      total + square(n)
    end
  end
end
