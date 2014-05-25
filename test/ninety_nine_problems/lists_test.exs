defmodule NinetyNineProblems.ListsTest do
  use ExUnit.Case
  alias NinetyNineProblems.Lists

  test "finds the last element of a list" do
    assert Lists.last([1,2,3]) == 3
  end

  test "finds the last but one element of a list" do
    assert Lists.penultimate([1,2,3]) == 2
  end

  test "finds the nth element of a list" do
    #nth 1-indexed
    assert Lists.element_at([1,2,5,6], 3) == 5
  end

  test "finds the length of a list" do
    assert Lists.llength([1,2,3,4]) == 4
  end

  test "reverses a list" do
    assert Lists.reverse([1,2,3,4]) == [4,3,2,1]
  end

  test "list is a palindrome" do
    assert Lists.is_palindrome([1,2,2,4]) == false
    assert Lists.is_palindrome([1,2,2,1]) == true
  end

  test "flattens a nested list" do
    assert Lists.flatten([1, [2,3], 4]) == [1,2,3,4]
  end

  test "eliminates consecutive duplicates of a list" do
    assert Lists.compress([1,3,3,5,6,6,5]) == [1,3,5,6,5]
  end

  test "packs consecutive duplicates into sublists" do
    assert Lists.pack([1,3,3,5,6,6,5]) == [[1], [3, 3], [5], [6,6], [5]]
  end

  test "run-length encodes a list" do
    assert Lists.encode([1,3,3,3,4,4,5,6,6,6,6]) == [[1,1], [3,3], [2,4], [1,5], [4,6]]
  end

  test "modified run-length encodes a list" do
    assert Lists.mod_encode([1,3,3,3,4,4,5,6,6,6,6]) == [1, [3,3], [2,4], 5, [4,6]]
  end

  test "decodes a run-length encoded list" do
    assert Lists.decode([1, [3,3], [2,4], 5, [4,6]]) == [1,3,3,3,4,4,5,6,6,6,6]
  end

  test "directly run-length encodes a list" do
    assert Lists.dir_encode([1,3,3,3,4,4,5,6,6,6,6]) == [1, [3,3], [2,4], 5, [4,6]]
  end

end
