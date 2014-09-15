phrase = "uh oh!!! hello there!"

def sort_phrase(phrase)
	phrase.gsub!(/[^a-zA-Z\s]/, "")
	array1 = phrase.split
	array1.sort!
	phrase2 = array1.join(" ")
	puts phrase2
end

sort_phrase(phrase)