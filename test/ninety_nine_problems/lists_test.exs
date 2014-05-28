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

  test "duplicates element of a list" do
    assert Lists.duplicate([1,2,3]) == [1,1,2,2,3,3]
  end

  test "multiplies element of a list" do
    assert Lists.multiply([1,2,3], 3) == [1,1,1,2,2,2,3,3,3]
  end

  test "drops every nth element of a list" do
    assert Lists.drop_every([1,2,3,4,5,6,7], 3) == [1,2,4,5,7]
  end

  test "splits a list into two" do
    assert Lists.split([1,2,3,4,5,6], 3) == [[1,2,3], [4,5,6]]
  end

  test "slices a list" do
    assert Lists.slice([1,2,3,4,5,6], 2, 4) == [2,3,4]
  end

  test "rotates a list" do
    assert Lists.rotate([1,2,3,4,5], 3) == [4,5,1,2,3]
  end

  test "removes an element from a list" do
    assert Lists.remove([1,2,3,4], 3) == [1,2,4]
  end

  test "inserts an element at a given position in a list" do
    assert Lists.insert([1,2,3,4], 3, 2) == [1,3,2,3,4]
  end

  test "creates a range from 2 integers" do
    assert Lists.range(1,5) == [1,2,3,4,5]
  end

  test "extract n random items from a list" do
    assert Lists.sample([1,2,3,4,5], 3) |> length == 3
  end

  test "extract n random items from a range" do
    assert Lists.range_sample(1,9,3) |> length == 3
  end

end
