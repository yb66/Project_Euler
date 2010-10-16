#!/usr/bin/env ruby -wKU

#add fold to the available method names
module Enumerable
  alias :fold inject unless Enumerable.method_defined? :fold
  def sum
    self.fold(:+)
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

ns = (1..9).to_a

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
end

t1 = Time.now
total = [ ]
(1..2).each do |k| #because the multiplicand will either be 1 or 2 digits
  ns.combi(5) do |lhs|  # split 9 digits, left hand side is set 
    rhs = ns - lhs # set the right hand side possible digits
    lhs.combi(k).each do |cand|
      cand.perm.map {|cand_p| (lhs - cand).perm.map {|plier| [cand_p,plier] } }.flatten(1).each do |cnd,pli| # same as list comp, only more verbose :(
        ( p = cnd.to_i * pli.to_i).divmod(10**4).first.zero? || next #skip if not 4 digits, p is final product
        if rhs.all? { |x| p.to_a.include? x } # break p into array form to see if rhs has all numbers needed
            rhs.perm( 9 - 5 ) do |rh| 
              total << p if rh.to_i == p unless total.include? p #no duplicates!
            end
        end #if
      end #m1.permutation
    end #lhs.combi
  end #ns.combinations
end # |cnd, pli|

puts "total:  #{total.sum}"
puts "Time: #{Time.now - t1}"