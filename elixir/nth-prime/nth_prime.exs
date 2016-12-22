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

    if is_prime?(number) do
      nth(count - 1, number)
    else
      nth(count, number)
    end
  end

  defp is_prime?(number), do: is_prime?(number, number - 1)
  defp is_prime?(number, 1), do: true
  defp is_prime?(number, candidate) do
    if rem(number, candidate) === 0 do
      false
    else
      is_prime?(number, candidate - 1)
    end
  end
end
