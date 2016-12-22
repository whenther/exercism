defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist
  def compare(a, a), do: :equal
  def compare(a, b) when length(b) < length(a) do
    case search_for_sublist(b, a) do
      true -> :superlist
      false -> :unequal
    end
  end
  def compare(a, b) do
    case search_for_sublist(a, b) do
      true -> :sublist
      false -> :unequal
    end
  end

  # Returns true if a is a sublist of b.
  defp search_for_sublist(_a, []), do: false
  # When the heads of a and b match, check if this is the start of the sublist run.
  defp search_for_sublist([head | a_tail], [head | b_tail]) do
    case match_sublist(a_tail, b_tail) do
      true -> true
      false -> search_for_sublist([head | a_tail], b_tail)
    end
  end
  defp search_for_sublist(a, [_b_head | b_tail]), do: search_for_sublist(a, b_tail)

  # Returns true if a matches the start of b.
  defp match_sublist([], _b), do: true
  defp match_sublist(_a, []), do: false
  defp match_sublist([head | a_tail], [head | b_tail]) do
    match_sublist(a_tail, b_tail)
  end
  defp match_sublist(_a, _b), do: false
end
