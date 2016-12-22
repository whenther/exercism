defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    # Songs are 1-indexed, beers are 0-indexed.
    number = number - 1

    current_bottles = "#{beer_count(number)} #{bottle(number)}"
    next_bottles = "#{beer_count(number - 1)} #{bottle(number - 1)}"

    """
    #{String.capitalize(current_bottles)} of beer on the wall, #{current_bottles} of beer.
    #{next_action(number)}, #{next_bottles} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(), do: lyrics(100..1)
  def lyrics(range) do
    range
    |> Enum.map(fn number -> verse(number) end)
    |> Enum.join("\n")
  end

  def next_action(0), do: "Go to the store and buy some more"
  def next_action(1), do: "Take it down and pass it around"
  def next_action(_), do: "Take one down and pass it around"

  def bottle(1), do: "bottle"
  def bottle(_), do: "bottles"

  def beer_count(-1), do: beer_count(99)
  def beer_count(0), do: "no more"
  def beer_count(number), do: number
end
