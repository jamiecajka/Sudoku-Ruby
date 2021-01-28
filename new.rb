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
   b = b - 3
  end
  return box
end

def make_a_column(b,board)  #make column array to test column
  a = 0
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
  return available.shuffle!
end


def complete_a_row(line,col,a,b,board)
  box = make_a_box(a,col,board)
  column = make_a_column(col,board)
  available = make_available_number_list()
  row = board[line]
  count = 9
  redos = 0
  box_col = 0
  while row.include?(0)  #fill in row
    num = available[0]
    #binding.pry
    if !box[0].include?(num) && !box[1].include?(num) && !box[2].include?(num) && !column.include?(num) && !row.include?(num)
      board[line][col] = num
      box[line][box_col] = num
      row[col] = num
      available.shift
      count -= 1
      col += 1
      box_col += 1
      if box_col % 3 == 0
        box = []
        box = make_a_box(a,col,board)
        box_col = 0
      end
      column = []
      column = make_a_column(col,board)
      #  binding.pry
    else
      binding.pry
      if count > redos
        reject = available.shift
        available << reject
        redos += 1
      else
        available = []
        available = make_available_number_list()
        board[line] = [0,0,0,0,0,0,0,0,0]
        row = board[line]
        count = 9
        redos = 0
        col = b
      end
      #binding.pry
    end
  end
  return board
end

board = complete_a_row(0,0,a,b,board)
  binding.pry

  #line = 0
  #col = 4
  #b = 3
  #count = 8
  #column = []
  #box = []
  #make_a_box(a,b,board,box)
  #make_a_column(b,0,board,column)
  #make_available_number_list(available)
  board = complete_a_row(1,0,a,b,board)
  binding.pry
