#!/usr/bin/env ruby -wKU

# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

module Primality
  
  a = 600_851_475_143
  f = 2 # smallest possible prime factor

  # Divide "evil big number" by lowest prime factors to get the
  #  biggest one. Prime factors are the numbers, which do not
  #  leave a rest. If a possible number is not a prime factor 
  #  candidate anymore, check the next one.
  lambda { |a,f| a%f==0 ? a /= f : f+=1  while a>1 }

  puts f
  

  def Primality.fac(n)
    n > 1 ? n * fac(n - 1) : n
  end

  def Primality.isPrime?( n=3 )
    ( fac(n-1) + 1 ) % n == 0
  end


  def Primality.sieveit( n, p, largest=0 )
    # puts "n:#{n} p:#{p} l:#{largest}"
    
    skipit = false
    #prime test
    [2,3,5,7,11,13,17,19,23,29].each do |s|
      skipit = true if p % s == 0
      break if skipit
    end
    
    # puts "skipit: #{skipit}"
    unless skipit
      if Primality.isPrime?(p)
          # puts "isprime"
        largest = p if n % p == 0
      end
    end
  
    p**2 > n ? largest : Primality.sieveit( n, p + 2, largest ) 
  end


end

# Primality.sieveit 600851475143, 3

# n = ARGV.shift.to_i || 600851475143
# # puts isPrime ARGV.shift.to_i
# puts "answer: #{primality( n, 2 )}"