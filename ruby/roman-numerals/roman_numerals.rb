module BookKeeping
  VERSION = 2
end

class Integer < Numeric
  NUMERALS = {
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I"
  }.freeze

  def to_roman
    split_digits.each_with_index.reduce("") do |numerals, (digit, i)|
      place = 10**i
      place_numerals = numeralize_place(digit, place, place * 5, place * 10)
      place_numerals + numerals
    end
  end

  private

  def split_digits
    self
    .to_i
    .to_s
    .split("")
    .map(&:to_i)
    .reverse
  end

  def numeralize_place(n, one, five, ten)
    # Convert numbers to letters.
    one = get_letter(one)
    five = get_letter(five)
    ten = get_letter(ten)

    if n == 0
      ""
    elsif n <= 3
      one * n
    elsif n == 4
      one + five
    elsif n == 5
      five
    elsif n <= 8
      five + (one * (n - 5))
    elsif n == 9
      one + ten
    end
  end

  def get_letter(place)
    NUMERALS[place] || ""
  end
end
