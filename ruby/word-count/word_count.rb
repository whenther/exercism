# Write a program that given a phrase can count the occurrences of each word in that phrase.

module BookKeeping
  VERSION = 1
end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = {}

    @phrase
    .downcase
    .gsub(/[^a-z\d']/, " ") # Remove all but letter, number, apostrophe.
    .gsub(/\s'/, " ") # Remove all leading single quotes.
    .gsub(/^'/, "")
    .gsub(/'\s/, " ") # Remove all trailing single quotes.
    .gsub(/'$/, "")
    .split
    .each do |word|
      # Initialize the word.
      counts[word] ||= 0
      # Add one to it.
      counts[word] += 1
    end

    counts
  end
end
