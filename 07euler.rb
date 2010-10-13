$:.unshift File.expand_path("#{File.dirname(__FILE__)}")

require 'primer.rb'
require 'lazylist'

t1 = Time.now

primes_from3 = list { x }.where(:x => LazyList.from(3) ) { x % 2 == 1 && Primer.prime?( x ) }

primes = list(2) { primes_from3 } # put 2 at the front!

puts primes.take!(10001).last

puts( Time.now - t1 )


