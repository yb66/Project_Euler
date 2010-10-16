# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?

require 'prime' #builtin generator

def rotate( x )
  return true if x.length == 1 # already a prime, no rotations
  (x.length - 1).times do #first number is prime, so skip
    x = x[1..-1] + x[0]
    return false unless x.to_i.prime? #rotation fails
  end
  true
end



total = 0
t1 = Time.now

Prime.each(1_000_000 - 1) do |p|
  
  next unless rotate( p.to_s )
  total += 1
   
end

t_end = Time.now - t1
puts "total: #{total} time: #{t_end}"