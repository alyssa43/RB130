def step(start, last, inc)
  current_value = start
  until current_value > last
    yield(current_value)
    current_value += inc
  end
  current_value
end

step(1, 10, 3) { |value| puts "value = #{value}" }