module BookKeeping
  VERSION = 1
end

class Series
  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError.new("#{@series} doesn't have #{n} digits!") if n > @series.length

    output = []
    last_index = @series.length - n

    (0..last_index).each do |i|
      slice = @series[i, n]
      output.push(slice)
    end

    output
  end
end
