defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(""), do: false
  def pangram?(sentence) do
    sentence
    |> String.downcase
    # Remote all non-letter characters.
    |> String.replace(~r/[^a-z]/, "")
    |> String.to_charlist
    |> Enum.sort
    |> pangram_check
  end

  defp pangram_check(text), do: pangram_check(text, ?a - 1)
  # If all letters are gone, and we saw z, success.
  defp pangram_check([], ?z), do: true
  # If all letters are gone before z, fail.
  defp pangram_check([], _), do: false
  defp pangram_check([char | rest], last_char) do
    # If the character is the last one again, or the next one, all good.
    if last_char == char - 1 || last_char == char do
      pangram_check(rest, char)
    else
      false
    end
  end
end
