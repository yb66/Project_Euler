#!/usr/bin/env ruby -wKU

require 'lazylist'
#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end

total = 0
t2 = Time.now
(1..999_999).step(2) do |x|
	total += x if x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
  # print "."
end
puts total
puts "Time: #{Time.now - t2}"

total = 0
t1 = Time.now
total = list { x }.where( :x => 1..999_999 ) { x % 2 === 1 && x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse }.fold(0) {|sum,n| sum += n }
puts total
puts "Time: #{Time.now - t1}"




# $ ./36euler.rb
# 872187
# Time: 77.62152
# 872187
# Time: 0.806699
