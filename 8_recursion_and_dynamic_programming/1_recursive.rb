def count_ways(n)
  if n == 0
    return 1 
  elsif n < 0
    return 0 
  else
    return count_ways(n - 1) + count_ways(n - 2) + count_ways(n - 3)
  end
end

p count_ways(0) == 1
p count_ways(1) == 1
p count_ways(2) == 2
p count_ways(3) == 4
p count_ways(4) == 7
p count_ways(5) == 13 
