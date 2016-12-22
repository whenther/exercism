defmodule Bob do
  def hey(input) do
    default_response = "Whatever."

    cond do
      String.ends_with?(input, "?") ->
        "Sure."
      String.length(String.trim(input)) === 0 ->
        "Fine. Be that way!"
      not Regex.match?(~r/\p{L}/u, input) ->
        default_response
      String.upcase(input) === input ->
        "Whoa, chill out!"
      true ->
        default_response
    end
  end
end
