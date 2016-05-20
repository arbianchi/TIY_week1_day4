require "pry"

def answer_board
  range = (1..6).to_a
  answer_board = range * 2
  answer_board.shuffle
end

board_size = ("A".."L").to_a

def generate_display_board board_size
  [0,4,8].each do |start|
    stop = start + 3
    start.upto stop do |i|
      print " " + board_size[i] + " "
    end
    puts
  end
end

def randomize_answer_board
end


def coord_map

end

puts answer_board

generate_display_board board_size

board_map = Hash[board_size.zip(answer_board)]

binding.pry

# board = generate_board board_size

# numbers = (1..16).to_a
#
# board_map = Hash[board_size.zip(numbers)]


# until board.all? {|i| i.is_a?(Integer) }

puts "Choose a letter: "

choice1 = gets.chomp.upcase

# board_size[board_size.index(choice1)] = board_map[choice1]

# puts "Choose another letter: "
#
# choice2 = gets.chomp.upcase

# end

# print board ABC,DEF,GHI,JKL
# have corresponding array with numbers
# place pairs in array 1,1;2,2;3,3;4,4,5,5,6,6 randomly
# randomize
# player selects letter
# board reprints with revealed number
# letter/value pair is placed in prevselected hash
# reprints answer point
# prompt select another letter
# if values match, reprint updated board
# else reprint board
