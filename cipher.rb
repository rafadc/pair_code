def caesar_cipher(message, direction, shift=3)
	message = message.delete(" ").downcase
	message_array = message.chars


	cipher = ""

	message_array.each do |letter|
		if direction == "r"
			ordinal = (letter.ord + shift)
			if ordinal > 122
				ordinal -= 26
			end
		else
			ordinal = (letter.ord - shift)
			if ordinal < 97
				ordinal += 26
			end
		end


		cipher += ordinal.chr
	end

	puts cipher

end

phrase = gets.chomp

caesar_cipher(phrase, "l", 8)