defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(strand) do
    Enum.map(strand, &nucleotide_to_rna/1)
  end

  def nucleotide_to_rna(?G), do: ?C
  def nucleotide_to_rna(?C), do: ?G
  def nucleotide_to_rna(?T), do: ?A
  def nucleotide_to_rna(?A), do: ?U
  def nucleotide_to_rna(_char), do: raise ArgumentError, message: "#{_char} is not a nucleotide!"
end
