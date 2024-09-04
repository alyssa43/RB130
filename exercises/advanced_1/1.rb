factorial = Enumerator.new do |yielder|
  acc = 1
  num = 0
  loop do
    acc = num.zero? ? 1 : acc * num
    yielder << acc
    num += 1
  end
end

p factorial.take(7) # internal iterator?

# external iterator
7.times { |num| puts "#{num}! == #{factorial.next}"}
puts
3.times { |num| puts "#{num}! == #{factorial.next}"}
puts
factorial.rewind
7.times { |num| puts "#{num}! == #{factorial.next}"}

# internal iterator
factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
