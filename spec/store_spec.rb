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

end

