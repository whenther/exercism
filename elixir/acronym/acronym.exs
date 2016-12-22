defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    # adds underscores between camelCase words, for easy splitting.
    |> Macro.underscore
    # Upcase so the first letters are ready for abbreviation.
    |> String.upcase
    |> split_words
    |> Enum.reduce("", &(&2 <> String.first(&1)))
  end

  defp split_words(sentence) do
    String.split(sentence, ~r/[\P{L}]/u, trim: true)
  end
end
