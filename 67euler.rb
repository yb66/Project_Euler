#!/usr/bin/env ruby -wKU

t = []
ARGF.each { |line| t << line.split.map! {|s| s.to_i }  if line =~ /\d/ } 


(t.length - 1 ).downto(0) do |row_n|
  
  0.upto row_n - 1 do |node_n|
    #puts "-#{t[row_n][node_n]}"
    t[row_n-1][node_n] +=  [ t[row_n][node_n] , t[row_n][node_n + 1] ].max
  end
end

puts t[0][0]
