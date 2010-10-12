#!/usr/bin/env ruby -wKU


f = ->(n,times=1) do
  return false if times >= 50             #termination clause
  m = (n + n.to_s.reverse.to_i) 
  return true if m == m.to_s.reverse.to_i #check if palindrome
  f.(m, times + 1)                        #next try
end

total = 0

t1 = Time.now

1.upto(9999) do |n|
  total += 1 unless f.(n,1) 
end

t_end = Time.now - t1

puts "#total: #{total} time: #{t_end}"