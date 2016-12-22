defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Range.new(0, limit - 1)
    |> Enum.reduce(0, fn
      number, acc -> number_if_factor(number, factors) + acc
    end)
  end

  defp number_if_factor(_number, []), do: 0
  defp number_if_factor(number, [factor | tail]) do
    if is_factor?(number, factor), do: number, else: number_if_factor(number, tail)
  end

  defp is_factor?(number, number), do: true
  defp is_factor?(number, factor), do: rem(number, factor) === 0
end
