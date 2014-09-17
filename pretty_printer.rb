require 'date'

class PrintInput

	def initialize(user_input)
		@input_object = user_input
    @level_child = 1
	end

  def print_pretty
    if @input_object.is_a? Array
      process_array(@input_object)
    else
      puts "I do not know how to print this object."
    end
  end

  def check_class(element)
    if element.is_a? String
      print_string(element)
    elsif element.is_a? Numeric
      print_number(element)
    elsif element.is_a? Date
      print_date(element)
    elsif element.is_a? Time
      print_date(element)
    elsif element.is_a? Array
      print_array(element)
    elsif element.is_a? Hash
      print_hash(element)
    else
      puts "I don't know how to print this object."
    end
  end

  def indent
    "  " * @level_child
  end

  def print_string(string)
    puts indent + string
  end

  def print_number(number)
   puts indent + number.to_s
  end

  def print_date(date)
    puts indent + date.day.to_s + "-" + date.month.to_s + "-" + date.year.to_s
  end

  def print_array(array)
    @level_child += 1
    process_array(array)
    @level_child -= 1  
  end

	def process_array(array_for_print) 
		puts ("  " * (@level_child - 1)) + "Array:"
    array_for_print.each do |element|
			check_class(element)
		end
	end

  def print_hash(hash)
    @level_child += 1
    puts indent + "Hash:"
    hash.each do |key, value|
      print ("  " + indent) + key.to_s + " --> " 
      check_class(value)
    end
    @level_child -= 1  
  end

end

array_data = ["hi", Date.today, 5, [1, 2, 3, [3, 4, 5, [6, "test7", {:oranges => "test1", :grapes => 2, :banana => 3}, {:oranges => 4, :grapes => 5, :banana => 6}]]], ["hi", "what's", "up"], { :apple => [6, 7, 8], :oranges => 7, :grapes => 8, :banana => 9 }]
array = PrintInput.new(array_data).print_pretty

