#!/usr/bin/env ruby -wKU


# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# http://projecteuler.net/index.php?section=problems&id=5

(11..20).fold { |x,y| t = x.lcm y; puts "x: #{x} y: #{y} t: #{t}"; t; }

# 11.lcm 13
# 143
# 143.lcm 12
# 1716

