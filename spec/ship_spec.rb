require_relative '../lib/ship'

describe Ship  do

subject = Ship.new :location 

	it 'has a location' do
		expect(subject).to respond_to :location	
	end


	
end