def flip_a_bit(string)
  max_length = 0
  prev_length = 0
  curr_length = 0
  string.chars.map(&:to_i).each_with_index do |x, idx|
    curr_length += 1 if x == 1
    next unless x.zero? || idx == string.size - 1

    new_length = prev_length + curr_length + 1
    max_length = new_length if new_length > max_length
    prev_length = curr_length
    curr_length = 0
  end
  max_length
end

p flip_a_bit(1775.to_s(2)) # 8
p flip_a_bit('1011100010010001101111011011') # 7
