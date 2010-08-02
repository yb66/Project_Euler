#!/usr/bin/env ruby -wKU
year    = 1900
day    = [  :Sunday, :Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday, ]
months  = [
  [:January   , lambda {31}],
  [:February  , lambda { year == 2000 || year % 4 == 0 ? 29 : 28 }],
  [:March     , lambda {31}],
  [:April     , lambda {30}],
  [:May       , lambda {31}],
  [:June      , lambda {30}],
  [:July      , lambda {31}],
  [:August    , lambda {31}],
  [:September , lambda {30}],
  [:October   , lambda {31}],
  [:November  , lambda {30}],
  [:December  , lambda {31}],
]


sundays = 0
days = 1 # 1900 starts on a Monday
while year < 2001
  puts "year: #{year}"
  months.each do |m|
    puts "\t#{m.first}, starts on: #{day[days]}"
    if days == 0 && year > 1900 # we're only counting from 1901
      sundays += 1 
      puts "\t!!!!!Sundays so far: #{sundays}"
    end
    days = (days + m.last.call).divmod(7).last 
  end
  year += 1
end
puts sundays
