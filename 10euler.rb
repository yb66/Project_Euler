require 'prime'


# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.


t1 = Time.now

total = 0
Prime.each( 1_999_999 ) do |p|
  
  total += p
end

puts "total: #{total}"
puts( Time.now - t1 )



