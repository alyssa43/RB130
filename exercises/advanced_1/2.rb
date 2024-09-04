# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # => #<Proc:0x000000010e674df0 2.rb:2>
puts my_proc.class # => Proc
my_proc.call # => This is a .
my_proc.call('cat') # => This is a cat.

# Procs are objects created from the `Proc` class. They are created by invoking `proc`. They have lieniant arity, meaning they can be called without the appropriate number of arguments and will not complain. If a proc is invoked without the appropriate number of arguments `nil` will be assigned to the block variable.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda # => #<Proc:0x0000000106984b10 2.rb:9 (lambda)>
puts my_second_lambda # => #<Proc:0x0000000106984ac0 2.rb:10 (lambda)>
puts my_lambda.class # => Proc
my_lambda.call('dog') # => This is a dog.
my_lambda.call # => ArgumentError (given 0, expected 1)
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # => NameError: uninitialized constant Lambda

# Lambdas are objects created from the `Proc` class; they are a different variety of `Proc`. However, unlike a plain Proc object, they have strict arity. Meaning, if they are called with the incorrect number of arguments, it will raise an ArgumentError exception. Also, you cannot create a lambda by using `Lambda.new`; to create a lambda you call `lambda` or `->`.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # => This is a .
block_method_1('seal') # => LocalJumpError: no block given (yield)

# Blocks have a lieniant arity, meaning they can be executed without the appropriate number of arguments and will not complain. However, if a block in implicitly called using `yield` and there is no block given, it will raise a LocalJumpError exception

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # => This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end # => This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."} # => NameError: undefined variable `animal`

# # Blocks have a lieniant arity, meaning they can be executed without the appropriate number of arguments and will not complain. Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.

# Comparison:
# 1: Lambdas are types of Procs. Techincally they are both `Proc` objects. An implicit block is grouping of code, a type of closure, it is not an object.

# 2: Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.