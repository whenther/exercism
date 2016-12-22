defmodule Phone do
  @error_number_list List.duplicate("0", 10)

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    number_regex = ~r/\d/
    punctuation_regex = ~r/[\.\(\)\-+ ]/

    raw
    |> String.codepoints
    |> Enum.reduce_while([], fn point, acc ->
      cond do
        Regex.match?(number_regex, point) -> {:cont, [point | acc]}
        Regex.match?(punctuation_regex, point) -> {:cont, acc}
        true -> {:halt, @error_number_list}
      end
    end)
    |> Enum.reverse
    |> validate_count
    |> Enum.join
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0, 3)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    phone_number = number(raw)

    area = String.slice(phone_number, 0, 3)
    first_three = String.slice(phone_number, 3, 3)
    second_four = String.slice(phone_number, 6, 4)

    "(#{area}) #{first_three}-#{second_four}"
  end

  defp validate_count(["1" | list]) when length(list) === 10, do: list
  defp validate_count(list) when length(list) !== 10, do: @error_number_list
  defp validate_count(list), do: list
end
