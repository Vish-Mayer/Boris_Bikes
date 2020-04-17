# frozen_string_literal: true

require 'van'

describe Van do
  subject(:van) { described_class.new }
  let(:garage) { double(bikes: [broken_bike, working_bike]) }
  let(:station) { double(bikes: [broken_bike, working_bike]) }
  let(:broken_bike) { double(broken?: true, working?: false) }
  let(:working_bike) { double(working?: true, broken?: false) }

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
    it 'only picks up broken bikes from a dockingstation' do
      van.pick_up_broken(station)
      expect(van.broken_bikes).to eq [broken_bike]
    end
    it 'removes broken bikes from a dockingstation' do
      van.pick_up_broken(station)
      expect(station.bikes).to eq [working_bike]
    end
  end

  it { is_expected.to respond_to(:deliver_broken).with(1).argument }

  describe '#deliver_broken' do
    it 'drops of broken bikes to a garage to be fixed' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(garage.bikes).to eq [broken_bike, working_bike, broken_bike]
    end
    it 'removes broken bikes from a van ' do
      van.pick_up_broken(station)
      van.deliver_broken(garage)
      expect(van.broken_bikes).to be_empty
    end
  end

  it { is_expected.to respond_to(:pick_up_fixed).with(1).argument }

  describe '#pick_up_fixed' do
    it 'only picks up working bikes from a garage' do
      van.pick_up_fixed(garage)
      expect(van.fixed_bikes).to eq [working_bike]
    end
    it 'removes all working bikes from a garage' do
      van.pick_up_fixed(garage)
      expect(garage.bikes).to eq [broken_bike]
    end
  end

  it { is_expected.to respond_to(:deliver_fixed).with(1).argument }

  describe '#deliver_fixed' do
    it 'drops of working bikes to a station' do
      van.pick_up_fixed(garage)
      van.deliver_fixed(station)
      expect(station.bikes).to eq [broken_bike, working_bike, working_bike]
    end
    it 'removes working bikes from a van' do
      van.pick_up_fixed(garage)
      van.deliver_fixed(station)
      expect(van.fixed_bikes).to be_empty
    end
  end
end
