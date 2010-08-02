#!/usr/bin/env ruby -wKU

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
end

class Fixnum
  def to_a
    exp = 1
    n = self.divmod(10**exp) #start at 10
    case n.first
      when 0 then [n.last]
      else n.first.to_a << n.last
    end 
  end
end

ns = (1..9).to_a

#lhs  combination of 9C5 == 126
#rhs  permutation 4 - 24 possible numbers, 1 / 24 chance lhs == rhs

f = lambda { |xs| xs.fold(0){|sum,x| sum += x * 10**(xs.length - xs.index(x) - 1) }}
class Array 
  def sum
    self.fold(:+)
  end
end

t1 = Time.now
total = [ ]
ks = [[1,4],[2,3]]
ks.each do |k|
  ns.combination(k.sum) do |c|  # possible multiplier/multiplicand numbers
    # 2 digit * 3 digit number - both are permutations
    m1s = c.combination(k.first) # multiplicand combinations [[1, 2], ...]
    leftovers = ns - c # 4 digits no used, [6,7,8,9]
    rhs = leftovers.permutation( 9 - k.sum ) #rhs permutations from remaining numbers
    # puts "#{rhs.to_a}"
    m1s.each do |m1| # [1,2] ...
      m2s = (c - m1).permutation # multiplier permutations [[3, 4, 5], [3, 5, 4], ... ]
      m1.permutation(m1.length).each do |m1p| #  => [1,2], [2,1] ...
        m2s.each do |m2| # m2 => [3,4,5], [4,3,5]...
          p = f.call(m1p) * f.call(m2)
          next unless p.divmod(10**4).first.zero?
          if leftovers.all? { |x| p.to_a.include? x } # see if it's worth running test below
            rhs.each do |rh| #test each product against remaining 4 numbers
              r = f.call(rh)
              if r == p
                unless total.include? p
                  # puts "> #{f.call(m1p)} * #{f.call(m2)} = #{p}"
                  total << p 
                  # puts "total so far: #{total.sum}"
                end
              end
            end #rhs.each
          end #if
        end #m2s.each
      end #m1.permutation
    end #m1s.each
  end #ns.combinations
end

puts "total:  #{total.sum}"
puts "Time: #{Time.now - t1}"