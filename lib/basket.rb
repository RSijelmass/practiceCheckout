class Basket
	
	def initialize
		@items = Hash.new(0)
		@total_price = 0
	end

	def input(item)
		# if 2nd voucher: price added = 0 (% 2)
		@items[item] += 1 
		@items[item]
	end

	def total_price
		@total_price
	end
end
