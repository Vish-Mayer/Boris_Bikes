require 'van'

describe Van do

  subject(:van) { described_class.new }
  let(:garage) {double(:bikes => [working_bike, working_bike])}
  let(:bike) {double(:broken? => true)}
  let(:working_bike) {double(:working? => true)}
  let(:station) {double(:bikes => [bike])}

  it { is_expected.to respond_to(:broken_bikes) }
  it { is_expected.to respond_to(:fixed_bikes) }

  describe '#initialize' do
    it 'is initialized with an empty array to store broken bikes' do
      expect(van.broken_bikes).to be_empty
    end
    it 'is initialized with an empty array to store fixed bikes' do
      expect(van.fixed_bikes).to be_empty
    end 
  end

  it { is_expected.to respond_to(:pick_up_broken).with(1).argument }

  describe '#pick_up_broken' do
    it 'picks up broken bikes from a dockingstation' do
      van.pick_up_broken(station)
      expect(van.broken_bikes).to eq [bike]
    end
    it 'removes broken bike from a dockingstation' do
      van.pick_up_broken(station)
      expect(station.bikes).to_not eq [bike]
    end
  end

  it { is_expected.to respond_to(:deliver_broken).with(1).argument }

  describe '#deliver_broken' do
    it 'drops of bikes to a garage to be fixed' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(garage.bikes).to eq [working_bike, working_bike, bike]
    end
    it 'removes broken bikes from a van ' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(van.broken_bikes).to be_empty
    end
  end

  it { is_expected.to respond_to(:pick_up_fixed).with(1).argument }

  describe '#pick_up_fixed' do
    it 'picks up all working bikes from a garage' do
      van.pick_up_fixed(garage)
      expect(van.fixed_bikes).to eq [working_bike, working_bike]
    end
    it 'removes all working bikes from a garage' do
      van.pick_up_fixed(garage)
      expect(garage.bikes).to_not eq [working_bike, working_bike]
    end
  end

  it { is_expected.to respond_to(:deliver_fixed).with(1).argument }

  describe '#deliver_fixed' do
    it 'drops of working bikes to a station' do
      van.pick_up_fixed(garage)
      van.deliver_fixed(station)
      expect(station.bikes).to eq [bike, working_bike, working_bike]
    end
    it 'removes working bikes from a van' do
      van.pick_up_fixed(garage)
      van.deliver_fixed(station)
      expect(van.fixed_bikes).to be_empty
    end
  end 
end
