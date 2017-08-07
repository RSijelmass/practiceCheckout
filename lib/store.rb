class Store
	ITEMS = { voucher: 500,
		tshirt: 2000,
		mug: 750
	}

	def scan(item)
		ITEMS[item]
	end

end
