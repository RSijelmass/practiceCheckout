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
end

end

