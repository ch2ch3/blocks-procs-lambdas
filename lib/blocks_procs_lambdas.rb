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

	def recursive_map(&block)
		if block_given?
			copy = self.dup
			return [] if copy.empty?
			return [block.call(copy.shift)].concat(copy.recursive_map(&block))
		else
			return to_enum :recursive_map
		end
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

	def each()
		if block_given?
			for element in 0...self.size do
				yield(self[element])
			end
			self
		else
			return to_enum :each
		end
	end

end