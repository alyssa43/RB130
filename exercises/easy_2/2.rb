def zip(arr1, arr2)
  result = []
  arr1.size.times { |index| result << [arr1[index], arr2[index]] }
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]