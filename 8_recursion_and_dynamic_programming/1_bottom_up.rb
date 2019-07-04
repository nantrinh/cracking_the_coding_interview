def count_ways(n)
  if n < 0
    return 0
  elsif n == 0
    return 1
  end

  a = 0
  b = 0
  c = 1
  (1..n).each do |x|
    sum = a + b + c
    a = b
    b = c
    c = sum
  end
  c
end

p count_ways(0) == 1
p count_ways(1) == 1
p count_ways(2) == 2
p count_ways(3) == 4
p count_ways(4) == 7
p count_ways(5) == 13 
