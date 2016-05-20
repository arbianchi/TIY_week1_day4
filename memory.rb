require "pry"


fixed_board = ("A".."L").to_a

def start_board fixed_board
  print fixed_board[0..3].join
  puts
  print fixed_board[4..7].join
  puts
  print fixed_board[8..11].join
  puts
end

temp_board = ("A".."L").to_a


# def number_key
#   range = (1..6).to_a
#   number_key = range * 2
#   number_key.shuffle
# end

def generate_display_board temp_board
  print temp_board[0..3].join
  puts
  print temp_board[4..7].join
  puts
  print temp_board[8..11].join
  puts
end

def answer_key fixed_board
  range = (1..6).to_a
  number_key = (range * 2).shuffle
  board_map = Hash[fixed_board.zip(number_key)]
end

generate_display_board temp_board

answer_key = answer_key fixed_board

puts answer_key

puts "Choose a letter: "

choice1 = gets.chomp.upcase

temp_board[temp_board.index(choice1)] = answer_key[choice1]

puts "Choose another letter: "

choice2 = gets.chomp.upcase

temp_board[temp_board.index(choice2)] = answer_key[choice2]


puts generate_display_board temp_board

if answer_key[choice1] != answer_key[choice2]
  generate_display_board temp_board
  puts "No match! Try again."
  start_board fixed_board
else
  start_board = generate_display_board temp_board
  puts start_board
end
