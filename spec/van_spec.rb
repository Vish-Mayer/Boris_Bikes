require 'van'

describe Van do

  subject(:van) { described_class.new }
  let(:garage) {double(:bikes => [])}
  let(:bike) {double(:broken? => true)}
  let(:station) {double(:bikes => [bike])}

  describe '#initialize' do
    it 'is initialized with an empty array to store broken bikes' do
      expect(van.broken_bikes).to be_empty
    end
  end

  it { is_expected.to respond_to(:pick_up_broken).with(1).argument }

  describe '#pick_up' do
    it 'picks up broken bikes from a dockingstation' do
      van.pick_up_broken(station)
      expect(van.broken_bikes).to eq [bike]
    end
    it 'removes broken bike from a dockingstation' do
      van.pick_up_broken(station)
      expect(station.bikes).to_not eq [bike]
    end
  end

  describe '#deliver' do
    it 'drops of bikes to a garage to be fixed' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(garage.bikes).to eq [bike]
    end
    it 'drops of bikes to a garage to be fixed' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(van.broken_bikes).to be_empty
    end
  end
end
