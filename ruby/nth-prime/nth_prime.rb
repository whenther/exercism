module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(count)
    raise ArgumentError.new("count must be at least 1!") unless count > 0

    last_prime = nil
    i = 1

    while count > 0
      i += 1
      next unless prime?(i)

      count -= 1
      last_prime = i
    end

    last_prime
  end

  # Check if a number is prime.
  # TODO: Make this fast enough for the big_prime test.
  def self.prime?(number)
    # special case for 2.
    return true if number == 2

    is_prime = true
    top_factor = Math.sqrt(number).floor

    # Check if any numbers below the number are a factor.
    (2..top_factor).each do |factor|
      if (number % factor).zero?
        is_prime = false
        break
      end
    end

    is_prime
  end
end
