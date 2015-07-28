require_relative '../lib/ship'

describe Ship  do

subject = Ship.new 

	it 'has a location' do
		expect(subject).to respond_to :coordinates=	
	end

	it 'coordinates = nil when created' do
		expect(subject.coordinates).to eq nil
	end

	it 'has a size' do
		expect(subject.size).to eq Ship::DEFAULT_SIZE
	end

	
end