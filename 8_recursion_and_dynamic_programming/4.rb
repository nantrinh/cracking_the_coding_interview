def subsets(set, index=0)
  return [[]] if index == set.size
  result = subsets(set, index + 1)
  item = set[index]
  result.concat(result.map {|x| x + [item]})
  index.zero? ? result[1..-1] : result
end

p subsets(['a'])
# a
p subsets(['a', 'b'])
# # a, ab
# # b
res = subsets(['a', 'b', 'c'])
p res
p res.size # 7
# # a, ab, ac, abc
# # b, bc
# # c
res = subsets(['a', 'b', 'c', 'd'])
p res.map {|x| x.join}
p res.size # 15
p subsets(['a', 'b', 'c', 'd', 'e']).size # 31
