def count_ways(n, memo)
  return 1 if n.zero?
  return 0 if n < 0
  return memo[n] unless memo[n].nil?
  memo[n] = count_ways(n - 1, memo) + count_ways(n - 2, memo) + \
            count_ways(n - 3, memo)
end

memo = [0, 1]
p count_ways(0, memo) == 1
p count_ways(1, memo) == 1
p count_ways(2, memo) == 2
p count_ways(3, memo) == 4
p count_ways(4, memo) == 7
p count_ways(5, memo) == 13
