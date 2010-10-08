#!/usr/bin/env ruby -wKU

# n! means n x (n - 1) x ... x 3 x 2 x 1
# 
# Find the sum of the digits in the number 100!

n = 100

def fac( n )
  return 1 if n == 1
  n * fac( n - 1)
end

def summer( m ) #this accepts a string
  total = 0
  len = m.length - 1
  
  (0..len).each do |s|
    total += m[s].to_i
  end
  total
end

puts summer fac( n ).to_s
