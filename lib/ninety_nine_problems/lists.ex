defmodule NinetyNineProblems do

  defmodule Lists do

    def last(list), do: do_last(list, [])
    defp do_last([], _), do: nil
    defp do_last([h|[]], _acc), do: h
    defp do_last([h|t], acc) do
      do_last(t, [h|acc])
    end

    def penultimate(list), do: do_penultimate(list, [])
    defp do_penultimate([h|[_l]], _acc), do: h
    defp do_penultimate([h|t], acc) do
      do_penultimate(t, [h|acc])
    end

    def element_at([], _index), do: nil
    def element_at(list, index), do: do_element_at(list, index, 1)
    defp do_element_at([h|_t], index, counter) when index == counter, do: h
    defp do_element_at([_h|t], index, counter) do
      do_element_at(t, index, counter + 1)
    end

    def length([]), do: do_length([], 0)
    def length(list), do: do_length(list, 0)
    defp do_length([], counter), do: counter
    defp do_length([_h|t], counter) do
      do_length(t, counter + 1)
    end

    def reverse([]), do: do_reverse([], [])
    def reverse(list), do: do_reverse(list, [])
    defp do_reverse([], acc), do: acc
    defp do_reverse([h|t], acc) do
      do_reverse(t, [h|acc])
    end

    def is_palindrome([]), do: true
    def is_palindrome(list), do: list == reverse(list)

    def flatten([]), do: do_flatten([], [])
    def flatten(list), do: do_flatten(list, [])
    def do_flatten([], acc), do: acc |> reverse
    def do_flatten([h|t], acc) when is_list(h) do
      do_flatten(t, do_flatten(h, acc) |> reverse)
    end
    def do_flatten([h|t], acc) do
      do_flatten(t, [h|acc])
    end

    def compress([]), do: do_compress([], nil, [])
    def compress(list), do: do_compress(list, nil, [])
    def do_compress([], _h, acc), do: acc |> reverse
    def do_compress([h|t], h, acc) do
      do_compress(t, h, acc)
    end
    def do_compress([h|t], _previous, acc) do
      do_compress(t, h, [h|acc])
    end

    def pack(list), do: do_pack(list, nil, [], [])
    def do_pack([], _h, previous_sublist, acc), do: [previous_sublist|acc] |> reverse
    def do_pack([h|t], nil, [], acc) do
      do_pack(t, h, [h], acc)
    end
    def do_pack([h|t], h, previous_sublist, acc) do
      do_pack(t, h, [h | previous_sublist], acc)
    end
    def do_pack([h|t], _h, previous_sublist, acc) do
      do_pack(t, h, [h], [previous_sublist|acc])
    end
  end

end
