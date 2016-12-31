# The tricky thing here is that a leap year in the Gregorian calendar occurs:
# on every year that is evenly divisible by 4
# except every year that is evenly divisible by 100
# unless the year is also evenly divisible by 400

module BookKeeping
  VERSION = 2
end

class Year
  def self.leap?(year)
    divisible?(year, 4) && (!divisible?(year, 100) || divisible?(year, 400))
  end

  def self.divisible?(year, number)
    (year % number).zero?
  end
end
