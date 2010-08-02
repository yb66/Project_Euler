#!/usr/bin/env ruby -wKU

scores = { }
('A' .. 'Z').zip( 1..26) {|a,b| scores[a] = b }
total = 0

arr = ARGF.readlines(",").each { |l|
    l.gsub!( /\"/, '').gsub!( /,/ , '' )
}.sort!.each_with_index do |l, i| 
  sum = 0
  l.chars { |c| sum += scores[c] }
  sum *= i + 1
  puts "#{l} sum: #{sum}"
  total += sum
end

puts total
