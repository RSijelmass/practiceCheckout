require_relative 'basket.rb' 

class Store
	ITEM_LIST = { voucher: 500,
		tshirt: 2000,
		mug: 750
	}

	def initialize(basket = Basket.new)
		@basket = basket
		@total_price = 0
	end

	def scan(item)
		check_item_in_store(item)
		add_to_basket(item)
		ITEM_LIST[item]
	end

	def total_price
		@basket.items.each do |item, amount| 
			price = calculate_price(item, amount)
			amount % 2 == 0 ? (reduction = amount / 2) : (reduction = 0)
			@total_price += price * (amount - reduction)
		end
		@total_price
	end

	private

	def check_item_in_store(item)
		raise 'Item is not in the store!' unless ITEM_LIST[item]
	end

	def add_to_basket(item)
		@basket.input(item)
	end
	
	def calculate_price(item, amount) 
	  item == :tshirt && amount > 2 ? (return 1900) : (return ITEM_LIST[item])
	end
end
