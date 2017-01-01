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
    decoded =
      text.scan(/(\d*)([^\d])/).map do |data|
        DecodedChar.new(data).print
      end

    decoded.join("")
  end

  def self.print_encoded_chars(encoded)
    encoded.map(&:print).join("")
  end
end

class DecodedChar
  def initialize(data)
    count_string = data[0]
    @count = count_string.empty? ? 1 : count_string.to_i
    @char = data[1]
  end

  def print
    @char * @count
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
