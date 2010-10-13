
require 'primer.rb'
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

def factors( n )
  p = Primer.ld( n )
  return n if p == n
  factors n.div( p )
end

NUM = 600851475143

t1 = Time.now

hp = factors NUM

t_end = Time.now - t1

puts "largest prime factor of 600851475143 is #{hp}, time taken: #{t_end}"