# tictactoe turn and player structure

class Game

	attr_reader :player_turn
	
	def initialize
		random_start = rand(2)
		if random_start == 0
			@player_turn = "X"
		else
			@player_turn = "O"
		end
	end
	

	def turn
		puts "#{@player_turn}'s turn."
		puts "Enter your move: "
		

	end

	def switch_turn
		if @player_turn == "X"
			@player_turn = "O"
		elsif @player_turn == "O"
			@player_turn = "X"
		end
	end

	def start_game
		puts "Welcome to Tic Tac Toe"
		puts "Play by typing the column position and row position separated by a space"
		puts "Ex:  top middle"
		puts "\"#{@player_turn}\" goes first."

	end
end