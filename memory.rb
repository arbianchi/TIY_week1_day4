require "pry"

attempts = 20
matches = 0

start_board = ("A".."L").to_a
temp_board = ("A".."L").to_a
correct_answers_board = ("A".."L").to_a

def generate_answer_key start_board
  range = (1..6).to_a
  number_key = (range * 2).shuffle
  Hash[start_board.zip(number_key)]
end

def print_board board
  puts
  print board[0..3].join
  puts
  print board[4..7].join
  puts
  print board[8..11].join
  puts
end

def choose_letter choice

  if choice == "choice1"
    puts "Choose a letter: "

    choice1 = gets.chomp.upcase
  else
    puts "Choose another letter: "

    choice2 = gets.chomp.upcase
  end
end

answer_key = generate_answer_key start_board

puts answer_key # REMOVE

until matches == 6 || attempts == 0

  puts "Choose a letter: "

  choice1 = gets.chomp.upcase

  puts "Choose another letter: "

  choice2 = gets.chomp.upcase

  if answer_key[choice1] != answer_key[choice2]
    temp_board[start_board.index(choice1)] = answer_key[choice1]
    temp_board[start_board.index(choice2)] = answer_key[choice2]
    print_board temp_board
    puts
    puts "No match! Try again."
    attempts -= 1
  else
    puts "You found a match!"
    correct_answers_board[start_board.index(choice1)] = answer_key[choice1]
    correct_answers_board[start_board.index(choice2)] = answer_key[choice2]
    matches += 1
    attempts -= 1
  end
  print_board correct_answers_board

  # binding.pry
end
