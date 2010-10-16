# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?

require 'prime' #builtin generator

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end

class Array 
  alias :perm permutation #for brevity
  alias :combi combination
  def to_i # convert an array of integers to an integer, [1,2,3,4] => 1234
    sum,mag = 0,0
    self.reverse_each do |x|
      sum += x * 10**mag
      mag += 1
    end
    
    sum
  end


  def Array.rotate( xs, len=nil, new_xs=[] )
    len ||= xs.length #first time through, set termination
    new_xs << xs
    return xs if len <= 1 #termination clause
    rotate( [xs.last] + xs[0..(xs.length-2)], len - 1, new_xs )
    return new_xs
  end

end

class Fixnum
  def to_a # convert an integer to an array of integers 1234 => [1,2,3,4]
    exp = 1
    n = self.divmod(10**exp) #start at 10
    case n.first
      when 0 then [n.last]
      else n.first.to_a << n.last
    end 
  end
end

#all combinations
digits = (1..9).to_a

total = 0
cs.each do |c|
  if c.to_i.prime?
    puts "c: #{c.inspect}"
    if Array.rotate(c).uniq.all? { |cp| cp.to_i.prime? }
      #c.perm.to_a.inspect
      total += 1 
      puts "total: #{total}"
    end
  end
end

puts "total: #{total}"