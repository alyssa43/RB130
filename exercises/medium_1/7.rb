def bubble_sort!(array, &block)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if compare([array[index - 1], array[index]], &block)

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

def compare(elements, &block)
  if block && block.parameters.size == 2 # block with two arguments
    block.call(elements[0], elements[1]) 
  elsif block && block.parameters.size == 1 # block with one argument
    block.call(elements[0]) <= block.call(elements[1])
  else
    elements[0] <= elements[1]
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)