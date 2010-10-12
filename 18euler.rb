#!/usr/bin/env ruby -wKU

# class Triangle
#  
#   attr_accessor :me, :left, :right
#   
#   def initialize( me, left, right )
#     @me     = me
#     @left   = left  || nil
#     @right  = right || nil
#   end
#   
#   
# end

triangle = %w{75} <<
%w{95 64} <<
%w{17 47 82} <<
%w{18 35 87 10} <<
%w{20 04 82 47 65} <<
%w{19 01 23 75 03 34} <<
%w{88 02 77 73 07 63 67} <<
%w{99 65 04 28 06 16 70 92} <<
%w{41 41 26 56 83 40 80 70 33} <<
%w{41 48 72 33 47 32 37 16 94 29} <<
%w{53 71 44 65 25 43 91 52 97 51 14} <<
%w{70 11 33 28 77 73 17 78 39 68 17 57} <<
%w{91 71 52 38 17 14 91 43 58 50 27 29 48} <<
%w{63 66 04 68 89 53 67 30 73 16 69 87 40 31} <<
%w{04 62 98 27 23 09 70 98 73 93 38 53 60 04 23}

total = 75
row_pos = 0
triangle.each_with_index do |row, row_n|
  
  if row_n == 0
  else
    puts "pos: #{row_pos} n: #{row[row_pos]}"
    
    total += row[row_pos].to_i #add to the total the current position
  end
  next_row = row_n + 1 #limit 14

  unless next_row > triangle.length #don't bother if near/at the end of the tri
    highest = 0
    h = {}
    right = row_pos + 1
    right_right = right + 1
    next_next = next_row + 1 # limit 13
    last_row = triangle.length - 1
    puts "row_n: #{row_n} last_row: #{last_row} total: #{total}"
    
    unless next_row > last_row
      h["left"] = triangle[next_row][row_pos].to_i #next row, left
      h["right"] = triangle[next_row][right] #next row, right
      puts "next_row: #{next_row} next_next: #{next_next}"
    
      unless next_next > last_row
        h["left_left"] = triangle[next_next][row_pos].to_i #2nd row, left left
        h["left_right"] = triangle[next_next][right].to_i #2nd row, left right
        h["right_left"] = triangle[next_next][right].to_i #2nd row, right left
        h["right_right"] = triangle[next_next][right_right].to_i #2nd row, right right
        puts "left: #{h["left"]} right: #{h["right"]} left_left: #{h["left_left"]} left_right: #{h["left_right"]} right_left: #{h["right_left"]} right_right: #{h["right_right"]}"
        
        highest, hand = [h["left"] + h["left_left"], "left"]
        
        highest, hand = [h["left"] + h["left_right"], "left"] if h["left"] + h["left_right"] > highest
        highest, hand = [h["right"] + h["right_left"], "right"] if highest > h["right"] + h["right_left"]
        highest, hand = [h["right"] + h["right_right"], "right"] if highest > h["right"] + h["right_right"]
        
        puts "highest: #{highest} hand: #{hand}"
      end
    end
    
  end
  
  #where to go next?
  unless next_next > last_row
    row_pos = h[hand] == "left" ? row_pos : row_pos + 1
  else
    
  end  
end

puts total

