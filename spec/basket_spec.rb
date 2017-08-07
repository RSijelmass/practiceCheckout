require 'basket'

describe Basket do
	let(:basket) { Basket.new }

	describe '#input' do
		it 'puts one item in basket, stores item and its amount' do
			expect(basket.input(:tshirt)).to eq 1
		end
	end

	describe '#total_price' do
		it 'gives the total price of an empty basket as 0' do
			expect(basket.total_price).to eq 0
		end
	end

end
