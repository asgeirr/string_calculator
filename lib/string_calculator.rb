class StringCalculator
	attr_accessor :logger

	def initialize (logger)
		@logger = logger
	end

	def add(string)

		sum = 0

		raise "negatives not allowed" if string.include? "-"

		string = string.gsub(/[^\d]/, ',')
		numbers = string.split(',')
		numbers.each {|x| sum += x.to_i unless x.to_i > 1000}

		@logger.write("got #{sum}")

		return sum
	end

end

class Logger
	attr_accessor :text
	def write(text)
		@text = text
	end
end
