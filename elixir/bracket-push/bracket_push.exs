defmodule BracketPush do
  @left ["{", "[", "("]
  @right ["}", "]", ")"]
  @to_right %{
    "{" => "}",
    "[" => "]",
    "(" => ")"
  }

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(""), do: true
  def check_brackets(str) do
    open_brackets = str
    |> String.graphemes
    |> Enum.reduce_while([], fn
      left, brackets when left in @left ->
        {:cont, [@to_right[left] | brackets]}
      right, [right | brackets] ->
        {:cont, brackets}
      right, _brackets when right in @right ->
        {:halt, false}
      _, brackets ->
        {:cont, brackets}
    end)

    case open_brackets do
      [] -> true
      false -> false
      _ -> false
    end
  end
end
