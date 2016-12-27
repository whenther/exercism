# Determine if a sentence is a pangram. A pangram
# is a sentence using every letter of the alphabet at least once.
# The best known English pangram is
# "The quick brown fox jumps over the lazy dog."

# The alphabet used is ASCII, and case insensitive, from 'a' to 'z'
# inclusively.

module BookKeeping
  VERSION = 3
end

class Pangram
  A_POINT = "a".codepoints[0]
  Z_POINT = "z".codepoints[0]

  def self.pangram?(text)
    return false if text == ""

    last_letter =
      text
        .downcase
        .gsub(/[^a-z]/, "") # Remove all non-letter characters.
        .codepoints
        .sort
        .reduce(A_POINT) do |last_char, char|
          break false unless last_char == char - 1 || last_char == char
          char
        end

    last_letter && last_letter == Z_POINT
  end
end
