require_relative 'tictactoe_game.rb'
require_relative 'tictactoe_board.rb'



new_board = Board.new 

new_game = Game.new()
new_game.start_game

while !new_board.winner && new_board.board_not_full
	new_board.display
	new_game.turn
	new_board.make_move(new_game.player_turn)
	new_game.switch_turn
end

new_board.display

# if new_board.winner
# 	new_board.winner
# elsif !new_board.board_not_full
# 	new_board.stale_mate
# end

# start game
# set new board
# random player goes first
# make move       <----
# check for win        |
# next player      ----
#git pull request



