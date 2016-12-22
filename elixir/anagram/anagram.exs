defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    # Downcase for case insensitive sort. Do it here so it only happens once.
    base = String.downcase(base)

    Enum.filter(candidates, fn
      word -> anagram?(base, word)
    end)
  end

  defp anagram?(base, word) do
    word = String.downcase(word)

    case word do
      # Matching words don't count.
      ^base -> false
      _ -> sort_letters(base) === sort_letters(word)
    end
  end

  defp sort_letters(word) do
    word
    |> String.graphemes
    |> Enum.sort
  end
end
