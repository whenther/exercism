defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    result = ""
    |> check_factor(number, 3, "Pling")
    |> check_factor(number, 5, "Plang")
    |> check_factor(number, 7, "Plong")

    case result do
      "" -> Integer.to_string(number)
      _ -> result
    end
  end

  defp check_factor(result, number, factor, sound) do
    if is_factor?(factor, number) do
      result <> sound
    else
      result
    end
  end

  defp is_factor?(factor, factor), do: true
  defp is_factor?(factor, number), do: rem(number, factor) === 0
end
