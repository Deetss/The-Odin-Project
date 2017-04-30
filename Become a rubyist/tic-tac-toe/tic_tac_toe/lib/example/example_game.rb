require_relative "../tic_tac_toe/version.rb"
require_relative "../tic_tac_toe/cell.rb"
require_relative "../tic_tac_toe/player.rb"
require_relative "../tic_tac_toe/board.rb"
require_relative "../tic_tac_toe/core_extensions.rb"
require_relative "../tic_tac_toe/game.rb"

puts "Welcome to tic tac toe!"

puts "Please input a name for player one!"
player_one_name = gets.chomp.capitalize

puts "Please choose a mark for player one!(one letter please!)"

player_one_mark = gets.chomp

while player_one_mark.length > 1
  puts "Please only choose one letter!"
  player_one_mark = gets.chomp
end

puts "Please input a name for player two!"

player_two_name = gets.chomp.capitalize

puts "Please choose a mark for player two!(one letter please!)"

player_two_mark = gets.chomp

while player_two_mark.length > 1
  puts "Please only choose one letter!"
  player_two_mark = gets.chomp
end

player_one = TicTacToe::Player.new({color: player_one_mark, name: player_one_name})
player_two = TicTacToe::Player.new({color: player_two_mark, name: player_two_name})
players = [player_one,player_two]
TicTacToe::Game.new(players).play
