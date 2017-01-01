module BookKeeping
  VERSION = 1
end

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(last)
    return 0 if last == 1

    last -= 1

    (1..last).reduce(0) do |acc, n|
      if multiple?(n)
        acc + n
      else
        acc
      end
    end
  end

  private

  def multiple?(n)
    @multiples.find do |m|
      (n % m).zero?
    end
  end
end
