# Initial Solution
def divisors(divisor)
  (1..divisor).select { |num| divisor % num == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99_400_891) == [1, 9967, 9973, 99_400_891] # may take a minute

# Further Expoloration:
def divisors(divisor)
  result = []
  (1..Math.sqrt(divisor)).each do |num|
    if divisor % num == 0
      result << num
      result << divisor / num 
    end
  end
  result.sort.uniq
end

p divisors(999_962_000_357) == [1, 999_979, 999_983, 999_962_000_357]
