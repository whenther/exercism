defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> split_words
    |> Enum.reduce(%{}, &count_word/2)
  end

  defp split_words(sentence) do
    String.split(sentence, ~r/[^\p{L}-\d]/u, trim: true)
  end

  defp count_word(word, words) do
    Map.update(words, word, 1, &(&1 + 1))
  end
end
