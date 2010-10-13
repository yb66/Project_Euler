$:.unshift File.expand_path("#{File.dirname(__FILE__)}")

require 'primer.rb'
require 'lazylist'


# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.


t1 = Time.now

i = 0
total = 2
3.upto( 1_999_999 ) do |i|
  
  next if i % 2 == 0 # get rid of evens
  next unless Primer.prime? i
  
  total += i
end

puts "total: #{total}"
puts( Time.now - t1 )



