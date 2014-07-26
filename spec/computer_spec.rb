require 'computer'

describe Computer do
	let(:computer){ Computer.new }

	it 'has a choice of Rock, Paper and Scissors' do
		expect(computer.choices).to include('Rock', 'Paper', 'Scissors')
	end

	it 'can make a choice of Rock' do
		allow(computer).to receive(:choice).and_return('Rock')
		expect(computer.choice).to eq('Rock')
	end

	it 'can make a choice of Scissors' do
		allow(computer).to receive(:choice).and_return('Scissors')
		expect(computer.choice).to eq('Scissors')
	end

	it 'is generated as a new player' do
		computer.generate
		expect(computer.bot).to be_an_instance_of Player
	end

	it "can make a pick" do
		allow(computer).to receive(:choice).and_return('Paper')
		computer.generate
		expect(computer.bot.pick).to eq("Paper")
	end

	it 'returns a player on generate' do
		expect(computer.generate).to be_an_instance_of Player
	end



end