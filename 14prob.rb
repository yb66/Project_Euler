#!/usr/bin/env ruby -wKU

#http://projecteuler.net/index.php?section=problems&id=14

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end

def collatz( n=1, c=0 ) # n is number, c is chain length
  c += 1
  # puts "n: #{n} c: #{c}"
  unless n == 1
    n % 2 == 0 ? n /= 2 : n = 3 * n + 1
    c = collatz n, c
  end
  return c
end
  
  
i = 1000000
c = 0 # current longest chain length
t1 = Time.now
while i > 0
  j = collatz i #get chain length for i
  if j > c      # if the new number is greater than c then replace it
    c = j
    puts "c: #{c} #{i}"
  end
  i = i - 1
  puts "end" if i == 0
end
f1 = Time.now - t1
puts "f1: #{f1}"
# c: 153 1000000
# c: 259 999999
# c: 290 999667
# c: 396 999295
# c: 440 997823
# c: 458 970599
# c: 507 939497
# c: 525 837799
# end


