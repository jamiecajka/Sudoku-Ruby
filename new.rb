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
 box = Array.new
def make_a_box(a,b,board,box)  #make box array to test 3x3 square
 3.times do
   line_test = Array.new
   3.times do
     line_test << board[a][b]
     b += 1
   end
   box << line_test
   a += 1
   b = b - 3
 end
 return box
end

column =  Array.new
def make_a_column(a,b,board,column)  #make column array to test column
  9.times do
    column << board[b][a]
    b += 1
  end
  return column
end

available = Array.new
def make_available_number_list(available)  #create array of available numbers
  num = 1
  9.times do
    available << num
    num += 1
  end
  return available.shuffle!
end

#make row array to test row
row = board[a]

make_a_box(a,b,board,box)
make_a_column(a,b,board,column)
make_available_number_list(available)

line = 0
col = 0
count = 8
while available.count > 0  #fill in first box
  num = available[0]
  if !box.include?(num) && !column.include?(num) && !row.include?(num)
    board[line][col] = num
    box[line][col] = num
    available = available.slice!(1,count)
    count -= 1
  else
    go_to_end = available.shift()
    available << go_to_end
  end
  if col == 2
    line += 1
    col = 0
    row = board[line]
  else
    col += 1
  end
  column = []
  make_a_column(col,0,board,column)
  #binding.pry
end

  binding.pry
