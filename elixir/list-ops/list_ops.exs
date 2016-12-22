defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn _, count -> count + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn item, reversed -> [item | reversed] end)
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map(l, f) do
    reduce(l, [], fn item, list ->
      transformed_item = f.(item)
      [transformed_item | list]
    end)
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn item, list ->
      case f.(item) do
        true -> [item | list]
        false -> list
      end
    end)
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([first | rest], acc, f) do
    acc = f.(first, acc)
    reduce(rest, acc, f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append(a, b) do
    concat([a, b])
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat(ll) do
    reduce(ll, [], fn
      item, list -> reduce(item, list, fn item, list -> [item | list] end)
    end)
    |> reverse
  end
end
