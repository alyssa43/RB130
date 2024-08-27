def max_by(array)
  return nil if array.empty?

  index = 0
  hightest_val = yield(array[0])

  1.upto(array.size - 1) do |current_index|
    current_val = yield(array[current_index])
    if current_val > hightest_val
      index = current_index
      hightest_val = current_val
    end
  end
  array[index]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil