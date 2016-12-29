module BookKeeping
  VERSION = 2
end

class Robot
  ALPHABET = ('A'..'Z').to_a
  attr_reader :name
  @@names = []

  def initialize
    set_name
  end

  def reset
    set_name
  end

  private

  def set_name
    name = random_name
    while @@names.include?(name)
      name = random_name
    end

    @name = name
    @@names.push(name)
  end

  def random_name
    random_letter + random_letter + random_number + random_number + random_number
  end

  def random_letter
    i = Random.rand(26)
    ALPHABET[i]
  end

  def random_number
    Random.rand(0..9).to_s
  end
end
