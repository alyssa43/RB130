birds = %w(raven finch hawk eagle)
# birds # => ['raven','finch','hawk','eagle']

def types(birds)
  yield(birds)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}"
end


# def skip_first_two_elements(array)
#   array[2..-1].each { |item| yield(item) }
# end
# raptors = []
# skip_first_two_elements(birds) { |bird| raptors << bird }
# p raptors