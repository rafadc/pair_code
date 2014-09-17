require 'date'
require 'pry'

class PrettyPrinter
  def initialize(printee, level=0)
    @printee = printee
    @current_level = 0 + level
    @printers = [ BasicPrinter.new, DatePrinter.new, ArrayPrinter.new, DefaultPrinter.new ]
  end

  def get_string_to_print
    use_printer = @printers.detect { |printer| printer.print(@printee, indent) }
    use_printer.print(@printee, indent)
  end

  def print_me
    puts get_string_to_print
  end

  def indent
    return "  " * @current_level
  end
end

class BasicPrinter
  def print(printee, indent)
    indent + printee.to_s if (printee.is_a? String) || (printee.is_a? Fixnum)
  end
end

class DatePrinter
  def print(printee, indent)
    indent + printee.strftime("%d-%m-%Y") if printee.is_a? Date
  end
end

class ArrayPrinter
  def print(printee, indent)
    if printee.is_a? Array
      array_to_string = indent + "Array:\n"
      printee.each {|i| array_to_string << indent + PrettyPrinter.new(i, 1).get_string_to_print + "\n" }
      return array_to_string
    end
  end
end

class DefaultPrinter
  def print(printee, indent)
    indent + "I can not print this"
  end
end

a = PrettyPrinter.new([1, 2, 3, "Hello", [1,2,3], "Hi", Date.today]).print_me
