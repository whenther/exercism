defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    [a, b, c]
    |> Enum.sort
    |> Enum.reverse
    |> ordered_check
  end

  defp ordered_check([a, b, c]) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  # The hint seems to suggest adding this check, but that fails a test, so I dunno.
  # defp ordered_check([a, b, c]) when a == b + c, do: {:ok, :degenerate}
  defp ordered_check([a, b, c]) when a >= b + c, do: {:error, "side lengths violate triangle inequality"}
  defp ordered_check([a, a, a]), do: {:ok, :equilateral}
  defp ordered_check([a, a, _c]), do: {:ok, :isosceles}
  defp ordered_check([_a, _b, _c]), do: {:ok, :scalene}
end
