class Board
	def initialize(board_file, moves_file)
		@board = board_to_hash(File.open(board_file))
		@moves = file_to_array(File.open(moves_file))

	end

	def file_to_array(board_file)
		board_file.map{|line| line.split(" ")}
	end

	def board_to_hash(board)
		array = file_to_array(board)
		temp_hash = {}
		("a".."h").each_with_index do |x, index|
			temp_hash[x] = {}
			array[index].each_with_index do |element, index|
				temp_hash[x][index] = element
			end
		end
		return temp_hash
	end

	def print_board
		@board.each do |key, line|
			line.each do |square, contents|
				print contents + " "
			end
			print "\n"
		end
	end

	def print_moves
		@moves.each do |x|
			puts x[0] + x[1]
		end
	end

	def process_moves
		@moves.each do |move|
			validate_move(move)
		end
	end

	def validate_move(move)
		move1 = check_space(move[0])
		move2 = check_space(move[1])
		puts move1
		puts move2
		# puts square
	end

	def check_color(square)
		if square[0] == "b"
			return "black"
		else
			return "white"
		end
	end

	def check_space(square)
		a = square[0]
		b = square[1].to_i - 1
		current_space = @board[a][b]
		if current_space == "--"
			return true
			# puts square + " " + @board[a][b] + " " + false.to_s
		else
			return check_color(current_space)
			# puts square + " " + @board[a][b] + " " + true.to_s
		end
		# puts @board[a][b].class
	end

end

class Pawn
	def move_black
	end

	def move_white
	end
end

class Bishop
	def move_black
	end

	def move_white
	end
end

class Knight
	def move_black
	end

	def move_white
	end
end

class Queen
	def move_black
	end

	def move_white
	end
end

class King
	def move_black
	end

	def move_white
	end
end

board = Board.new("simple_board.txt", "simple_moves.txt")
board.process_moves