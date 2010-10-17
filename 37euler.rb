# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

require 'prime'

t1 = Time.now
ps = [ ]

Prime.each do |p|
  break if ps.length == 11
  next if p < 11
  left = right = p.to_s 
  
  catch (:failed) do # if either left or right fails, then skip to next prime
    # from left
    (left.length - 1).times do
      left = left[1..(left.length - 1)]
      throw :failed unless left.to_i.prime?
    end
        
    # from right
    (right.length - 1).times do
      right = right[0..(right.length - 2)]
      throw :failed unless right.to_i.prime?
    end
    
    ps << p #made it this far, then you're one of the 11
    puts ps.inspect
  end
end

t_end = Time.now - t1
puts "total: #{ps.reduce(:+)} time: #{t_end}"

