defmodule RomanConstants do
  @subtractable_numbers [100, 10, 1]

  def numerals do
    [
      {1000, "M"},
      {500, "D"},
      {100, "C"},
      {50, "L"},
      {10, "X"},
      {5, "V"},
      {1, "I"}
    ]
  end

  def subtractable_numerals do
    Enum.filter(numerals, fn {arabic, _} -> arabic in @subtractable_numbers end)
  end
end

defmodule RomanSubtractableNumerals do

  def start_link do
    numerals = subtractable_numerals
    Agent.start_link(fn -> numerals end, name: __MODULE__)
  end

  @doc "Get subtractable numerals below a number."
  def get(number) do
    Agent.get(__MODULE__, &(&1))
    |> Enum.filter(fn {arabic, _} -> arabic < number end)
  end

  defp subtractable_numerals do
    # For each numeral
    RomanConstants.numerals
    |> Enum.reverse
    |> Enum.reduce([], fn {arabic, roman}, acc ->
      # For each subtractable numeral under the numeral
      RomanConstants.subtractable_numerals
      |> Enum.filter(fn {number, _} -> number < arabic end)
      |> Enum.reduce(acc, fn {number, roman_number}, acc ->
        # Add the value and numeral of the subtracted pair.
        [{arabic - number, roman_number <> roman} | acc]
      end)
    end)
  end

end

defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    RomanSubtractableNumerals.start_link

    numerals(number, "")
  end
  defp numerals(0, roman), do: roman
  defp numerals(number, roman) do
    {remainder, next_roman} = next_numeral(number, RomanConstants.numerals)
    numerals(remainder, roman <> next_roman)
  end

  # Get the next numeral for the number, and return it and the remainder.
  defp next_numeral(number, [{number, roman} | numerals]), do: {0, roman}
  defp next_numeral(number, [{arabic, roman} | numerals]) when number > arabic, do: {number - arabic, roman}
  defp next_numeral(number, [{arabic, roman} | numerals]) do
    # Search for a subtractable that exactly matches the remainder.
    matching_subtractables = Enum.filter(RomanSubtractableNumerals.get(arabic), fn
      {subtractable_arabic, _} -> subtractable_arabic === arabic
    end)

    # If one exists, use it and finish. Otherwise, recur down a step.
    case matching_subtractables do
      [] -> next_numeral(number, numerals)
      [{subtractable_arabic, subtractable_roman}] -> {0, subtractable_roman}
    end
  end
end
