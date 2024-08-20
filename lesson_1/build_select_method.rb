# def select(array)
#   new_array = []
#   counter = 0

#   while counter < array.size
#     current_element = array[counter]
#     status = yield(current_element)
#     new_array << current_element if status
#     counter +=1
#   end

#   new_array
# end

# OR

def select(array)
  new_array = []

  array.each do |element|
    status = yield(element)
    new_array << element if status
  end

  new_array
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? } == [1, 3, 5]     # => [1, 3, 5]

p select(array) { |num| puts num } == []    # => [], because "puts num" returns nil and evaluates to false

p select(array) { |num| num + 1 } == [1, 2, 3, 4, 5]     # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

