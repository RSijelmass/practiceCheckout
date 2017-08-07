class Basket
	attr_reader :items
	
	def initialize
		@items = Hash.new(0)
	end

	def input(item)
		@items[item] += 1 
	end
end

