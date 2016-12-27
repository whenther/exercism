# Given a DNA strand, its transcribed RNA strand is formed by replacing
# each nucleotide with its complement:

# * `G` -> `C`
# * `C` -> `G`
# * `T` -> `A`
# * `A` -> `U`

module BookKeeping
  VERSION = 4
end

class Complement
  COMPLEMENTS = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }.freeze

  def self.of_dna(dna)
    rna = []
    is_invalid = false

    dna.each_char do |char|
      rna_char = convert(char)

      if rna_char
        rna.push(rna_char)
      else
        is_invalid = true
        break
      end
    end

    if is_invalid
      ""
    else
      rna.join("")
    end
  end

  def self.convert(dna_char)
    COMPLEMENTS[dna_char]
  end
end
