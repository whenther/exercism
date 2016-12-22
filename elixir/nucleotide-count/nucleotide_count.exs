defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(_strand, nucleotide) when not nucleotide in @nucleotides do
    raise ArgumentError, "${nucleotide} is not a nucleotide!"
  end

  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn
      ^nucleotide, count -> count + 1
      char, count when char in @nucleotides -> count
      char, _ -> raise ArgumentError, message: "#{char} is not a nucleotide!"
    end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    counts = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

    Enum.reduce(strand, counts, fn
      char, counts when char in @nucleotides -> Map.update!(counts, char, &(&1 + 1))
      char, _counts -> raise ArgumentError, message: "#{char} is not a nucleotide!"
    end)
  end

end
