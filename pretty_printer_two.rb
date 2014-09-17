require 'date'
require 'pry'

class PrettyPrinter
  def initialize(printee)
    @printee = printee
    @printers = [ BasicPrinter.new, DatePrinter.new, DefaultPrinter.new ]
  end

  def print_me
    first_that_prints_something = @printers.detect { |printer| printer.print(@printee) }
    puts first_that_prints_something.print(@printee)
  end
end

class BasicPrinter
  def print(printee)
    printee.to_s if (printee.is_a? String) || (printee.is_a? Fixnum)
  end
end

class DatePrinter
  def print(printee)
    printee.strftime("%d-%m-%Y") if printee.is_a? Date
  end
end

class DefaultPrinter
  def print(printee)
    "I can not print this"
  end
end

a = PrettyPrinter.new([1, 2, 3]).print_me
