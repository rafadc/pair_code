require 'date'

class PrintInput

	def initialize(user_input)
		@input_object = user_input
    @level_child = 1
    @hash_level
	end

  def print
    if @input_object.is_a? Array
      process_array(@input_object)
    else
      puts "I do not know how to print this object."
    end
  end

	def process_array(array_for_print) 
		puts "  "* (@level_child - 1) + "Array: level " + @level_child.to_s
    array_for_print.each do |element|
			if element.is_a? String
				print_string(element)
			elsif element.is_a? Numeric
        print_number(element)
      elsif element.is_a? Date
        print_date(element)
			elsif element.is_a? Array
        print_array(element)
			elsif element.is_a? Hash
        print_hash(element)
      else
        puts "I don't know how to print this object."
			end
		end
	end

	def print_string(string)
		puts ("  " * @level_child) + string
	end

  def print_number(number)
   puts ("  " * @level_child) + number.to_s
  end

  def print_date(date)
    puts ("  " * @level_child) + date.to_s
  end

  def print_array(array)
    @level_child += 1
    process_array(array)
    @level_child -= 1  
  end

  def print_hash(hash)
    puts "  " * (@level_child) + "Hash: level " + @level_child.to_s
    hash.each do |key, value|
      puts ("  " * (@level_child + 1)) + key.to_s + " --> " + value.to_s
    end
  end

end

array_data = ["hi", Date.today, 5, [1, 2, 3, [3, 4, 5, [6, 7, 8]]], ["hi", "what's", "up"], { :apple => [6, 7, 8], :oranges => 0, :grapes => 0, :banana => 0, :watermelon => 0 }]
array = PrintInput.new(array_data).print