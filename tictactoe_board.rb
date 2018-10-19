class Board

	def initialize
		@board = [["-","-","-"],["-","-","-"],["-","-","-"]]
		# @board = [["X","O","X"],["O","X","X"],["O","X","-"]]
	end

	def display
		print_line = ""
		@board.each do |row|
			row.each do |element|
				print_line += element + " "
			end
			print_line += "\n"
		end
		puts print_line
	end

	def make_move(who_player)
    board_idx = condition_input
    while !(valid_move?(board_idx[0], board_idx[-1]))
			# if valid_move?(board_idx[0], board_idx[1])
			# 	@board[board_idx[0]][board_idx[1]] = who_player
			# else
			board_idx = condition_input
			valid_move?(board_idx[0], board_idx[-1])
		end
		@board[board_idx[0]][board_idx[-1]] = who_player
	end

	def condition_input
		move = gets.chomp
		move_a = move.split(' ')
		row_word = move_a[0]
		column_word = move_a[1]
		return space(row_word, column_word)
	end

	def space(row, column)
		case row
		when "top"
			first = 0
		when "middle"
			first = 1
		when "bottom"
			first = 2
		else
			first = 3
		end

		case column
		when "left"
			second = 0
		when "middle"
			second = 1
		when "right"
			second = 2
		else
			second = 3
		end
			move_idx = [first, second]
		return move_idx
	end

	def valid_move?(row, column)

	  if row == 3 || column == 3
	  	puts "Please type: top middle bottom, with: left middle right"
	  	return false
	  elsif @board[row][column] != "-"
			puts "You cannot overwrite another move. Try Again you fucking idiot."
			return false
	  else
	  	return true
	  end
	end

	def winner
		i = 0
		winner_logic = false
		while i < @board.length
			if (@board[i][0] == @board[i][1]) && (@board[i][1] == @board[i][2]) && (@board[i][0] != "-")
				# puts "#{@board[i][0]} is the winner!!!"
				winner_logic = true
			end
			i += 1
		end
		j = 0
		while j < @board.length
			if @board[0][j] == @board[1][j] && @board[1][j] == @board[2][j] && @board[0][j] != "-"
				# puts "#{@board[0][j]} is the winner!!!"
				winner_logic = true
			end
			j += 1
		end
		if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != "-"
			# puts "#{@board[0][0]} is the winner!!!"
			winner_logic = true
		elsif @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2] && @board[2][0] != "-"
			# puts "#{@board[2][0]} is the winner!!!"
			winner_logic = true
		end
		return winner_logic
	end


	def board_not_full
		logic = @board.any? do |x|
			x.include?("-")

		end
	end

	def stale_mate
		puts "No moves left"
		puts "D R A W"
	end
end