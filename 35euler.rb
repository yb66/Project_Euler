# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?

require 'prime' #builtin generator

class String
  def String.rotate( x, len=nil, xs=[] )
    len ||= x.length #first time through, set termination
    xs << x.to_i
    return [x.to_i] if len <= 1 #termination clause
    rotate( x[-1] + x[0..(x.length - 2)], len - 1, xs )
    return xs.uniq
  end
end


total = 0

Prime.each(100) do |p|

  total += 1 if String.rotate( p.to_s ).all? { |pr| pr.prime? }

end




puts "total: #{total}"