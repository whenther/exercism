defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance('', ''), do: {:ok, 0}

  def hamming_distance(strand, strand), do: {:ok, 0}

  def hamming_distance(strand1, strand2) when length(strand1) !== length(strand2) do
    {:error, "Lists must be the same length."}
  end

  def hamming_distance(strand1, strand2) do
    hamming_distance(strand1, strand2, 0)
  end

  defp hamming_distance([head | strand1], [head | strand2], count) do
    hamming_distance(strand1, strand2, count)
  end

  defp hamming_distance([_head1 | strand1], [_head2 | strand2], count) do
    hamming_distance(strand1, strand2, count + 1)
  end

  defp hamming_distance('', '', count), do: {:ok, count}
end
