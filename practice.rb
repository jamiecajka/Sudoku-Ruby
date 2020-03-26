require 'bundler'
require 'pry'

#make board
board = Array.new
 9.times do
   line = Array.new
   while line.length < 9
     num = rand(1..9)
     if line.none? { |e| e == num }
       line << num
     end
   end
   board << line
 end

#make columns array
o = 0
columns_test = Array.new
9.times do
  p = 0
  line_test = Array.new
  9.times do
    num = board[p][o]
    line_test << num
    p+=1
  end #do
  columns_test << line_test
  o+=1
end #top do
rounds = 0
finished = false
until finished == true  do
  big_errors = Array.new
  m = 0
  9.times do
    little_error = Array.new
    n = 0
    9.times do
      if little_error.none?(columns_test[m][n])
        little_error << columns_test[m][n]
      else
        little_error << 'x'
      end #if
      n +=1
    end
    big_errors << little_error
    m += 1
  end #do

  count = 0
  for q in 0..8
    for r in 0..8
      if big_errors[q][r] == 'x'
        count += 1
      end
    end
  end

  if count > 0
    9.times do
      a = 0
      columns = Array.new
      9.times do
        b = 0
        line = Array.new
        9.times do
          num = board[b][a]
          line << num
          b+=1
        end #do
        columns << line
        a+=1
      end #top do

      #fix columns
      #make errors
       c = 0
      while c < 9
        errors = Array.new
        d = 0
        9.times do
          if errors.none?(columns[c][d])
            errors << columns[c][d]
          else
            errors << 'x'
          end #if
          d +=1
        end #do

        #find missing
        missing = Array.new
        for f in 1..9
          if errors.none? { |g| g == f }
            #binding.pry
            missing << f
          end #if
        end #for

        #replace x
        h = 0
        9.times do
          if errors[h] == 'x'
            j = c
            while j < 9
              if missing.any?(board[h][j])
                num = board[h][j]
                num2 = board[h][c]
                board[h][j] = num2
                board[h][c] = num
                missing.delete(num)
              #  binding.pry
                j = 9
              end #if
              j+=1
            end #while
          end #if
            h+=1
          end #do
          c += 1
      end #errors while

      #binding.pry
      a = board[0].shift
      board[0] << a
      a = board[1].shift
      board[1] << a
      a = board[2].shift
      board[2] << a
      a = board[3].shift
      board[3] << a
      a = board[4].shift
      board[4] << a
      a = board[5].shift
      board[5] << a
      a = board[6].shift
      board[6] << a
      a = board[7].shift
      board[7] << a
      a = board[8].shift
      board[8] << a
      rounds += 1
      finished = false
    end #do
  else
    finished = true
  end #if
  #binding.pry
  board[0].shuffle!
  board[1].shuffle!
  board[2].shuffle!
  board[3].shuffle!
  board[4].shuffle!
  board[5].shuffle!
  board[6].shuffle!
  board[7].shuffle!
  board[8].shuffle!
end #until

 binding.pry
 puts board
