# number_regex = ~r/\d/
# punctuation_regex = ~r/[\.\(\)\-+ ]/

module BookKeeping
  VERSION = 1
end

class PhoneNumber
  VALID_EXTRA_CHARACTERS = /[\.\(\)\-+ ]/
  VALID_LENGTH = 10
  INVALID_NUMBER = "0000000000".freeze

  attr_reader :number

  def initialize(input)
    @number = clean_input(input)
  end

  def area_code
    @number[0..2]
  end

  def to_s
    first_three = @number[3..5]
    last_four = @number[6..9]

    "(#{area_code}) #{first_three}-#{last_four}"
  end

  private

  def clean_input(input)
    number = input.gsub(VALID_EXTRA_CHARACTERS, "")
    length = number.length

    if /[^\d]/ =~ number
      INVALID_NUMBER
    elsif length == VALID_LENGTH
      number
    elsif length == VALID_LENGTH + 1 && number[0] == "1"
      number[1, VALID_LENGTH]
    else
      INVALID_NUMBER
    end
  end
end
