require "pry"

# print board ABC,DEF,GHI,JKL
# have corresponding array with numbers
# place pairs in array 1,1;2,2;3,3;4,4,5,5,6,6 randomly
# player selects letter
# board reprints with revealed number
# letter/value pair is placed in prevselected hash
# reprints hidden point
# prompt select another letter
# if values match, reprint updated board
# else reprint board

board = (" A "..." Z ").to_a

[0,3,6].each do |start|
  stop = start + 2
  start.upto stop do |i|
    print board[i]
  end
  puts
end
