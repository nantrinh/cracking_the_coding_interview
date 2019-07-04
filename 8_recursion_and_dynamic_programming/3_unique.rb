def binary_search(array, first, last)
  return if last < first

  midpoint_index = (first + last) / 2
  midvalue = array[midpoint_index]
  return midpoint_index if midvalue == midpoint_index

  if array[midpoint_index] >= midpoint_index
    binary_search(array, first, midpoint_index - 1)
  else
    binary_search(array, midpoint_index + 1, last)
  end
end

def magic_index(array)
  binary_search(array, 0, array.size - 1)
end

p magic_index([-1, 0, 2, 5, 6, 9, 10]) # 2
p magic_index([-5, -1, 0, 1, 3, 5, 10]) # 5
p magic_index([0, 5, 10, 11, 13, 15, 20]) # 0
p magic_index([-2, -1, 0, 1, 2, 4, 6]) # 6
p magic_index([10, 11, 12, 13]) # nil
