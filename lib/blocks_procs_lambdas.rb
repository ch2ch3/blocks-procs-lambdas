class Array

	def map()
		output = []
		if block_given?
			self.each do |element|
				output << yield(element)
			end
		else
			return to_enum :map
		end
		output
	end

	def select()
		output = []
		if block_given?
			self.each do |element|
				output << element if yield(element)
			end
		else
			return to_enum :select
		end
		output
	end

end