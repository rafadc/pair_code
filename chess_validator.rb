class Board
	def initialize(filename)
		@board = board_to_hash(File.open(filename))

	end

	def file_to_array(board_file)
		board_file.each_with_object([]) do |line, board_array|
			board_array << line.split(" ")
		end
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

board = Board.new("simple_board.txt").print_board


# Board.new("simple_board.txt").array_to_hash