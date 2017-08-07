class Store
	ITEMS = { voucher: 500,
		tshirt: 2000,
		mug: 750
	}

	def scan(item)
		raise 'Item is not in the store!' unless ITEMS[item]
		ITEMS[item]
	end

end
