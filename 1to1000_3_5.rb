#!/usr/bin/env ruby -wKU


# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

answer = 0
(1..999).each do |n|
  answer += n if ( n % 3 == 0 || n % 5 == 0  )
end

puts answer

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end

answer = (3..999).fold { |sum, n| (n % 3 ==0 || n % 5 == 0) ? sum + n : sum }