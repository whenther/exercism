defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @scores [
    {1, ~w(a e i o u l n r s t)},
    {2, ~w(d g)},
    {3, ~w(b c m p)},
    {4, ~w(f h v w y)},
    {5, ~w(k)},
    {8, ~w(j x)},
    {10, ~w(q z)}
  ]

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.trim
    |> String.downcase
    |> String.codepoints
    |> Enum.reduce(0, fn letter, score -> score + get_score(letter) end)
  end

  defp get_score(letter), do: get_score(letter, @scores)
  defp get_score(letter, [{score, letters} | scores]) do
    case letter in letters do
      true -> score
      false -> get_score(letter, scores)
    end
  end
end
