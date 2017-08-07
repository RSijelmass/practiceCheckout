class Store
	ITEMS = { voucher: 500,
		tshirt: 2000,
		mug: 750
	}

	def initialize
		@basket = 0
	end

	def scan(item)
		check_item_in_store(item)
		add_to_basket(item)
		ITEMS[item]
	end

	def total_price
		@basket
	end

	private

	def check_item_in_store(item)
		raise 'Item is not in the store!' unless ITEMS[item]
	end

	def add_to_basket(item)
		@basket += ITEMS[item]
	end
end
