require 'bundler'
require 'pry'

#make board
board = Array.new

 9.times do
   line = Array.new
   while line.length < 9
       line << 0
     end
   board << line
 end

a = 0
b = 0
#make row array to test row
row = board[a]
#make column array to test column
column =  Array.new
c = b
9.times do
  column << board[c][a]
  c += 1
end
#make box array to test 3x3 square
box = Array.new
e = b
3.times do
  line_test = Array.new
  d = a
  3.times do
    line_test << board[d][e]
    e += 1
  end #do
  box << line_test
  d += 1
  e = b
end #top do
binding.pry
