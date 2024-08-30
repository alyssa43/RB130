items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, grain |
  puts produce.join(', ')
  puts grain
end # Should output:
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |fruit, *veg, grain|
  puts fruit
  puts veg.join(', ')
  puts grain
end # Should output:
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |fruit, *other|
  puts fruit
  puts other.join(', ')
end # Should output:
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |item1, item2, item3, item4|
  puts [item1, item2, item3, item4].join(', ')
end # Should ouptut:
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!