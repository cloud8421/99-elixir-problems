defmodule NinetyNineProblems do

  defmodule Lists do

    def last(list), do: do_last(list, [])
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

  end

end
