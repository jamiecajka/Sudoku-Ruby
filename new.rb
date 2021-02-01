require 'bundler'
require 'pry'

#make board
board = Array.new
 10.times do
   line = Array.new
   while line.length < 9
       line << 0
     end
   board << line
 end

a = 1
b = 0
line = 1

def make_a_box(a,b,board)  #make box array to test 3x3 square
  box = Array.new
  3.times do
   line_test = Array.new
   3.times do
     line_test << board[a][b]
     b += 1
   end
   box << line_test
   a += 1
   b -= 3
  end
  return box
end

def make_a_column(b,board)  #make column array to test column
  a = 1
  column =  Array.new
  9.times do
    column << board[a][b]
    a += 1
  end
  return column
end

def make_available_number_list()  #create array of available numbers
  available = Array.new
  num = 1
  9.times do
    available << num
    num += 1
  end
  available.shuffle!
  return available.shuffle!
end


def complete_a_row(line,col,a,b,board)
  box = make_a_box(a,col,board)
  column = make_a_column(col,board)
  available = make_available_number_list()
  row = board[line]
  count = 9
  redos = 0
  box_row = 0
  reset_count = 0
  while row.include?(0)  #fill in row
    num = available[0]
    #binding.pry
    if line == 4 || line == 5 || line == 6
      box_row =  1
    elsif line == 7 || line == 8 || line == 9
      box_row = 2
    end
    if !box[0].include?(num) && !box[1].include?(num) && !box[2].include?(num) && !column.include?(num) && !row.include?(num)
      board[line][col] = num
      box[box_row][col] = num
      row[col] = num
      available.shift
      count -= 1
      col += 1
      if col % 3 == 0
        box = []
        box = make_a_box(a,col,board)
      end
      column = []
      column = make_a_column(col,board)
      #  binding.pry
                            else
                              zeros = board[line].select {|x| x == 0}
                              binding.pry
                              if available.count > zeros.count
                                binding.pry
                                reject = available.shift
                              else
                                if reset_count == 0
                                  board[line] = [0,0,0,0,0,0,0,0,0]
                                  row = board[line]
                                  count = 9
                                  col = b
                                  reset_count += 1
                                else
                                  board[line] = [0,0,0,0,0,0,0,0,0]
                                  board[line + 1] = [0,0,0,0,0,0,0,0,0]
                                  count = 9
                                  line -= 1
                                  reset_count -= 1
                                end
                                make_a_box(a,col,board)
                                available = []
                                available = make_available_number_list()
                              end
                              #binding.pry
                            end
  end
  return board
end

board = complete_a_row(line,0,a,b,board)
  binding.pry
change_a = [4,7]

while line < 9
  if !board[line].include?(0)
    line += 1
  end
  if change_a.include?(line)
    a += 3
  end
#  binding.pry
  board = complete_a_row(line,0,a,b,board)
  binding.pry
end
