class Board
	def initialize(filename)
		@board_file = File.open(filename)
		@board = array_to_hash

	end

	def file_to_array(board_file)
		board_array = []
		board_file.each do |line|
			temp_array = line.split(" ")
			board_array.push(temp_array)
		end
		return board_array.reverse!
	end

	def array_to_hash
		array = file_to_array(@board_file)
		temp_hash = Hash.new
		("a".."h").each_with_index do |x, index|
			temp_hash[x] = Hash.new
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