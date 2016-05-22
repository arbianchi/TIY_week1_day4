require "pry"

attempts = 7
matches = 0

def select_level
  print "Choose a level: E for easy, M for medium, or H for hard: "
  level = gets.chomp.downcase
  if level == "e"
    "H"
  elsif level == "m"
    "L"
  elsif level == "h"
    "P"
  else
    puts "Please enter E, M, or H: "
  end
end

level = select_level

start_board = ("A"..level).to_a
temp_board = ("A"..level).to_a
correct_answers_board = ("A"..level).to_a

def generate_answer_key start_board
  range = (1..(start_board.count / 2)).to_a
  number_key = (range * 2).shuffle
  Hash[start_board.zip(number_key)]
end

def print_board board
  x = 0
  until x > (board.count - 1) do
  x.upto(x+3) { |i| print board[i], " " }
  puts
  x += 4
  end
end

print_board correct_answers_board

answer_key = generate_answer_key start_board

puts answer_key # REMOVE

until matches == 6 || attempts == 0

  temp_board = correct_answers_board.clone

  puts "Choose a letter: "
  choice1 = gets.chomp.upcase

  puts "Choose another letter: "
  choice2 = gets.chomp.upcase

  if choice1.to_i != 0 || choice2.to_i != 0

    puts "Enter two valid LETTERS please."

  elsif choice1.split.count > 1 || choice2.split.count > 1

    puts "Enter only ONE letter."

  elsif correct_answers_board.include?(choice1) == false || correct_answers_board.include?(choice2) == false

    puts "One of those choices is already matched! Guess again."

  elsif answer_key[choice1] != answer_key[choice2]

    temp_board[start_board.index(choice1)] = answer_key[choice1]
    temp_board[start_board.index(choice2)] = answer_key[choice2]
    print_board temp_board
    puts
    puts "No match! Try again."
    attempts -= 1

  else answer_key[choice1] == answer_key[choice2]

    puts "You found a match!"
    correct_answers_board[start_board.index(choice1)] = answer_key[choice1]
    correct_answers_board[start_board.index(choice2)] = answer_key[choice2]
    matches += 1
    attempts -= 1

  end
  print_board correct_answers_board

  binding.pry
end

if matches == 6
  print "You Win!"
else
  puts "You Lose!"
end
