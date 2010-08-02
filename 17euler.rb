#!/usr/bin/env ruby -wKU

# n = ARGV.shift.to_i
# abort( 'Number needs to be 1..999') unless (1..999) === n
UNITS = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
TEENS = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
TENS = [ '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

answer = 0

1.upto(1000) do |m|
  s = ''
  if m.divmod(1000).first >= 1
    s += UNITS[ m.divmod(1000).first ] + ' thousand' 
    m -= m.divmod(1000).first * 1000
  end
  mod = m.divmod(100)
  # print "s: #{s} mod: #{mod}\n"
  if mod.first > 0
    s += ', ' unless s.empty?
    s += UNITS[ mod.first ] + ' hundred' #sort out hundreds
  end
  
  if mod.last > 0  
    s += ' and ' unless s.empty? # and if needed
  
    s += case mod.last #last two digits
    when 0..9 then UNITS[mod.last]
    when 10..19 then TEENS[mod.last - 10]
    when 20..99
      d = mod.last.divmod(10)
      d.last == 0 ? TENS[d.first] : TENS[d.first] + '-' + UNITS[d.last]
    end #case
    # s += n2
  end

answer += s.gsub( /[\s\-,]/, '' ).length
print "s: #{s}, answer so far: #{answer}\n"

end
puts "final answer: #{answer}"
