module BookKeeping
  VERSION = 3
end

class Raindrops
  def self.convert(number)
    answer = ""

    answer << "Pling" if factor_of(number, 3)
    answer << "Plang" if factor_of(number, 5)
    answer << "Plong" if factor_of(number, 7)

    answer.empty? ? number.to_s : answer
  end

  def self.factor_of(number, factor)
    (number % factor).zero?
  end
end
