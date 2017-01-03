defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    # Remove all non-letter characters.
    |> String.replace(~r/\P{L}/u, "")
    |> String.graphemes
    |> Enum.sort
    |> check_for_duplicates
  end

  defp check_for_duplicates([letter | word]), do: check_for_duplicates(word, letter)
  defp check_for_duplicates([], _), do: true
  defp check_for_duplicates([letter | _word], letter), do: false
  defp check_for_duplicates([letter | word], _last_letter), do: check_for_duplicates(word, letter)
end
