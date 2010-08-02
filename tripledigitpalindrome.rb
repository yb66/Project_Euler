#!/usr/bin/env ruby -wKU


A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.

Find the largest palindrome made from the product of two 3-digit numbers.


#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end


l = 0 
(100..999).each do |x| 
  (x..999).each do |y| 
    p = x*y 
    l = p if (p.to_s == p.to_s.reverse) && p > l
  end
end
puts l


(100..999).each do |x|
  m = (x..999).max_by do |y| 
    p = x*y 
  end
  print "m: #{m}"
  l = m if (m.to_s == p.to_s.reverse) && p > l

end
puts l 