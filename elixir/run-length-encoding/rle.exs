defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end
  def encode(string) do
    list = string
    |> String.graphemes
    |> Enum.reduce([], &encode_letter/2)
    |> Enum.reduce("", fn {letter, count}, output -> "#{count}#{letter}#{output}" end)
    end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\p{L})/u, string)
    |> Enum.reduce("", &decode_letter/2)
  end

  defp encode_letter(letter, []) do
    [{letter, 1}]
  end
  defp encode_letter(letter, [last_letter | rest] = letter_list) do
    case last_letter do
      {^letter, count} -> [{letter, count + 1} | rest]
      _ -> [{letter, 1} | letter_list]
    end
  end

  defp decode_letter([_, count_string, letter], output) do
    count = String.to_integer(count_string)
    output <> String.duplicate(letter, count)
  end
end
