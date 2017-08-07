require 'store'

describe Store do
	let(:basket) { double(:basket, input: {}, items: { tshirt: 1, voucher: 1, mug: 1} ) }
	let(:store) { Store.new(basket) }

	describe 'scans items' do
		it 'scans a t-shirt' do
			expect(store.scan(:tshirt)).to eq 2000
		end
		it 'scans a mug' do
			expect(store.scan(:mug)).to eq 750 
		end
		it 'scans a voucher' do
			expect(store.scan(:voucher)).to eq 500
		end
		it 'raises an error if other item is scanned' do
			expect { store.scan(:fakeitem) }.to raise_error('Item is not in the store!')
		end
	end

	describe 'gives total price in basket' do
		it 'gives 0 if basket is empty' do
			store2 = Store.new
			expect(store2.total_price).to eq 0
		end
		it 'gives the price for all items in basket' do
			expect(store.total_price).to eq 3250
		end
	end

	describe 'handles special promotions' do
		it 'gives a 2-for-1 offer on vouchers' do
			basket_vouchers = double(:basket, items: { voucher: 6 } )
			store3 = Store.new(basket_vouchers)
			expect(store3.total_price).to eq 1500
		end
		it 'gives a discount on tshirts of €19 each if 3 or more bought' do
			basket_tshirts= double(:basket, items: { tshirt: 3 } )
			store4 = Store.new(basket_tshirts)
			expect(store4.total_price).to eq 5700
		end
	end
end

