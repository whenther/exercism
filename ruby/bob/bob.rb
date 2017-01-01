# Bob answers 'Sure.' if you ask him a question.
# He answers 'Whoa, chill out!' if you yell at him.
# He says 'Fine. Be that way!' if you address him without actually saying
# anything.
# He answers 'Whatever.' to anything else.

module BookKeeping
  VERSION = 1
end

class Bob
  def self.hey(remark)
    if silent?(remark)
      "Fine. Be that way!"
    elsif yelling?(remark)
      "Whoa, chill out!"
    elsif question?(remark)
      "Sure."
    else
      "Whatever."
    end
  end

  def self.question?(remark)
    remark[-1] == "?"
  end

  def self.yelling?(remark)
    # Yelling means there are letters, and they are capitalized.
    remark.match(/[a-zA-Z]/) && remark.upcase == remark
  end

  def self.silent?(remark)
    # Fail if the remark has any non-space characters.
    !remark.match(/[^\s]/)
  end
end
