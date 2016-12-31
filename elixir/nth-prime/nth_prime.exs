defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "0 is invalid!"
  def nth(count) do
    nth(count, 1)
  end
  defp nth(0, number), do: number
  defp nth(count, number) do
    number = number + 1

    if prime?(number) do
      nth(count - 1, number)
    else
      nth(count, number)
    end
  end

  defp prime?(number), do: prime?(number, top_factor_candiate(number))
  defp prime?(number, 1), do: true
  defp prime?(number, candidate) do
    if rem(number, candidate) === 0 do
      false
    else
      prime?(number, candidate - 1)
    end
  end

  defp top_factor_candiate(number) do
    number
    |> :math.sqrt
    |> Float.floor
    |> round
  end
end
