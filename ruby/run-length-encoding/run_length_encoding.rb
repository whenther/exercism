module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(text)
    encoded = []
    current_char = EncodedChar.new(nil)

    text.chars.each do |c|
      if c == current_char.char
        current_char.add
      else
        encoded.push(current_char)
        current_char = EncodedChar.new(c)
      end
    end
    # Push in the last character.
    encoded.push(current_char)

    print_encoded_chars(encoded)
  end

  def self.decode(text)
  end

  def self.print_encoded_chars(encoded)
    encoded.map(&:print).join("")
  end
end

class EncodedChar
  attr_reader :char

  def initialize(char)
    @char = char
    @count = 1
  end

  def add
    @count += 1
  end

  def print
    printable_count = @count == 1 ? "" : @count
    "#{printable_count}#{@char}"
  end
end
