# My solution
# def each(collection)
#   collection.each do |element|
#     yield(element)
#   end
# end

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

x = each([1, 2, 3, 4, 5]) { |num| puts num }

p x # => [1, 2, 3, 4, 5]