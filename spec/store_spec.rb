require 'store'

describe Store do
	let(:store) { Store.new() }

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
			expect(store.total_price).to eq 0
		end
		it 'gives the price if one item has been scanned' do
			store.scan(:voucher)
			expect(store.total_price).to eq 500
		end
		it 'gives the total price if more than one item has been scanned' do
			store.scan(:voucher)
			store.scan(:mug)
			expect(store.total_price).to eq 1250
		end
	end

	describe 'handles special promotions' do
		it 'gives a 2-for-1 offer on vouchers' do
			6.times { store.scan(:voucher) }
			expect(store.total_price).to eq 1500
		end
		it 'gives a discount on tshirts of €19 each if 3 or more bought' do
			3.times { store.scan(:tshirt) }
			expect(store.total_price).to eq 5700
		end
	end
end

