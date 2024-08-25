def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration

def compute(element)
  if block_given?
    yield(element)
  else
    'Does not compute'
  end
end

p compute(3) { |num| num + 5 } == 8
p compute('a') { |char| char + 'b' } == 'ab' 
p compute('Does not compute') == 'Does not compute'