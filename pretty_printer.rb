require 'date'

class PrintInput

	def initialize(user_input)
		@input_object = user_input
	end

  def print
    if @input_object.is_a? Array
      process_array
    else
      puts "I do not know how to print this object."
    end
  end

	def process_array
		puts "Array:"
    @input_object.each do |element|
			if element.is_a? String
				print_string(element)
			elsif element.is_a? Numeric
        print_number(element)
      elsif element.is_a? Date
        print_date(element)
			elsif element.is_a? Array
        print_array(element)
			elsif element.is_a? Hash
      else
        puts "I don't know how to print this object."
			end
		end
	end

	def print_string(string)
		puts "  " + string
	end

  def print_number(number)
   puts "  " + number.to_s
  end

  def print_date(date)
    puts "  " + date.to_s
    # puts "  " + Date._strptime(date, '%d-%m-%Y').join
  end

  def print_array(array)
    puts "  Sub Array:"
    array.each do | element|
      puts "    " + element.to_s
    end
  end

end

array_data = ["hi", Date.today, 5, [1, 2, 3]]
array = PrintInput.new(array_data).print