##There are so many project Euler questions regarding primes that I've built a class with common functions

## mostly taken from the book "The Haskell Road to Logic, Maths and Programming"

class Integer

  def divides_by?( d )
    self.remainder( d ) == 0
  end
end


class Primer

  class << self
  
    def ld( n )
      ldf 2, n
    end
  
    def ldf( k, n )
      if n.divides_by? k
        k
      elsif k**2 >= n
        n
      else
        ldf k+1, n
      end
    end
    
    def prime? n
      return false if n <= 1
      ld( n ) == n ? true : false
    end
    
  end
  

  
end #class


