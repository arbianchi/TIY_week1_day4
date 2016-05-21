require "pry"

matches = 0
fixed_board = ("A".."L").to_a
temp_board = ("A".."L").to_a

def generate_answer_key temp_board
  range = (1..6).to_a
  number_key = (range * 2).shuffle
  Hash[temp_board.zip(number_key)]
end

def print_board board
  print board[0..3].join
  puts
  print board[4..7].join
  puts
  print board[8..11].join
  puts
end

def update_temp_board temp_board, answer_key, choice1, choice2
temp_board[temp_board.index(choice1)] = answer_key[choice1]
temp_board[temp_board.index(choice2)] = answer_key[choice2]
end

answer_key = generate_answer_key temp_board

puts generate_answer_key temp_board
puts print_board temp_board

# until matches == 6

puts print_board fixed_board

puts "Choose a letter: "

choice1 = gets.chomp.upcase

puts "Choose another letter: "

choice2 = gets.chomp.upcase

update_temp_board temp_board, answer_key, choice1, choice2

puts print_board temp_board
#binding.pry

#
# temp_board[temp_board.index(choice2)] = answer_key[choice2]
#
#
# puts print_board temp_board
#
# if answer_key[choice1] != answer_key[choice2]
#   print_board temp_board
#   puts "No match! Try again."
#   print_board fixed_board
# else
#   puts "You found a match!"
#   print_board = print_board temp_board
#   puts print_board
#   matches += 1
# end
#
# end
