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

    def llength([]), do: do_llength([], 0)
    def llength(list), do: do_llength(list, 0)
    defp do_llength([], counter), do: counter
    defp do_llength([_h|t], counter) do
      do_llength(t, counter + 1)
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
    defp do_flatten([], acc), do: acc |> reverse
    defp do_flatten([h|t], acc) when is_list(h) do
      do_flatten(t, do_flatten(h, acc) |> reverse)
    end
    defp do_flatten([h|t], acc) do
      do_flatten(t, [h|acc])
    end

    def compress([]), do: do_compress([], nil, [])
    def compress(list), do: do_compress(list, nil, [])
    defp do_compress([], _h, acc), do: acc |> reverse
    defp do_compress([h|t], h, acc) do
      do_compress(t, h, acc)
    end
    defp do_compress([h|t], _previous, acc) do
      do_compress(t, h, [h|acc])
    end

    def pack(list), do: do_pack(list, nil, [], [])
    defp do_pack([], _h, previous_sublist, acc), do: [previous_sublist|acc] |> reverse
    defp do_pack([h|t], nil, [], acc) do
      do_pack(t, h, [h], acc)
    end
    defp do_pack([h|t], h, previous_sublist, acc) do
      do_pack(t, h, [h | previous_sublist], acc)
    end
    defp do_pack([h|t], _h, previous_sublist, acc) do
      do_pack(t, h, [h], [previous_sublist|acc])
    end

    def encode(list), do: do_encode(list |> pack, [])
    defp do_encode([], acc), do: acc |> reverse
    defp do_encode([h|t], acc) do
      do_encode(t, [[llength(h), last(h)]|acc])
    end

    def mod_encode(list), do: do_mod_encode(list |> pack, [])
    defp do_mod_encode([], acc), do: acc |> reverse
    defp do_mod_encode([h|t], acc) when length(h) == 1 do
      do_mod_encode(t, [last(h)|acc])
    end
    defp do_mod_encode([h|t], acc) do
      do_mod_encode(t, [[llength(h), last(h)]|acc])
    end

    def decode(list), do: do_decode(list, [])
    defp do_decode([], acc), do: acc |> reverse
    defp do_decode([[0,_n]|t], acc) do
      do_decode(t, acc)
    end
    defp do_decode([[i, n]|t], acc) do
      do_decode([[i-1,n]|t], [n|acc])
    end
    defp do_decode([h|t], acc) do
      do_decode(t, [h|acc])
    end

    def dir_encode([h|t]), do: do_dir_encode(t, [1,h], [])
    defp do_dir_encode([], counter, acc), do: [counter|acc] |> reverse
    defp do_dir_encode([h|t], [n,h], acc) do
      do_dir_encode(t, [n+1,h], acc)
    end
    defp do_dir_encode([h|t], [1,n], acc) do
      do_dir_encode(t, [1,h], [n|acc])
    end
    defp do_dir_encode([h|t], counter, acc) do
      do_dir_encode(t, [1,h], [counter|acc])
    end

    def duplicate(list), do: do_duplicate(list, [])
    defp do_duplicate([], acc), do: acc |> reverse
    defp do_duplicate([h|t], acc) do
      do_duplicate(t, [h|[h|acc]])
    end

  end

end
