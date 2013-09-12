class StringCalculator

	def initialize (logger)
		@logger = logger
	end

	def add(string)
		sum = 0
		numbers = string.split(",")
		numbers.each {|x| sum += x.to_i}
		return sum
		@logger.write("got 3")
	end

end

class SlowLogger
	def write(text)
	end
end
