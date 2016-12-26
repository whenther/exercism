module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming
  def self.compute(strand_one, strand_two)
    raise ArgumentError.new("Strands must be same length") unless strand_one.length == strand_two.length
    misses = 0
    
    for i in 0..strand_one.length
      if strand_one[i] != strand_two[i]
        misses += 1
      end
    end

    misses
  end
end
