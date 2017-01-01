# Binary

# Write a program that will convert a binary number, represented as a string (e.g. '101010'), to its decimal equivalent using first principles

# Implement binary to decimal conversion. Given a binary input
# string, your program should produce a decimal output. The
# program should handle invalid inputs.

# ## Note
# - Implement the conversion yourself.
#   Do not use something else to perform the conversion for you.

# ## About Binary (Base-2)
# Decimal is a base-10 system.

# A number 23 in base 10 notation can be understood
# as a linear combination of powers of 10:

# - The rightmost digit gets multiplied by 10^0 = 1
# - The next number gets multiplied by 10^1 = 10
# - ...
# - The *n*th number gets multiplied by 10^*(n-1)*.
# - All these values are summed.

# So: `23 => 2*10^1 + 3*10^0 => 2*10 + 3*1 = 23 base 10`

# Binary is similar, but uses powers of 2 rather than powers of 10.

# So: `101 => 1*2^2 + 0*2^1 + 1*2^0 => 1*4 + 0*2 + 1*1 => 4 + 1 => 5 base 10`.

module BookKeeping
  VERSION = 3
end

class Binary
  def self.to_decimal(binary)
    raise ArgumentError.new("Invalid binary!") if /[^01]/ =~ binary

    binary.reverse.chars.each_with_index.map do |n, power|
      n.to_i * (2**power)
    end.reduce(&:+)
  end
end
