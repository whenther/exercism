defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @numerals %{
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I"
  }

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> split_digits
    |> convert
  end

  defp convert(digits), do: convert(digits, 1, "")
  defp convert([], _, numerals), do: numerals
  defp convert([digit | digits], place, numerals) do
    place_numerals = numeralize_place(digit, place, place * 5, place * 10)
    convert(digits, place * 10, place_numerals <> numerals)
  end

  defp split_digits(number) do
    number
    |> Integer.to_string
    |> String.graphemes
    |> Enum.map(fn string ->
      {n, _} = Integer.parse(string)
      n
    end)
    |> Enum.reverse
  end

  defp numeralize_place(n, one, five, ten) do
    # Convert numbers to letters.
    one = get_letter(one)
    five = get_letter(five)
    ten = get_letter(ten)

    cond do
      n == 0 -> ""
      n <= 3 -> String.duplicate(one, n)
      n == 4 -> one <> five
      n == 5 -> five
      n <= 8 -> five <> (String.duplicate(one, n - 5))
      n == 9 -> one <> ten
    end
  end

  defp get_letter(place) do
    @numerals[place] || ""
  end
end
