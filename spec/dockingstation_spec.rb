# frozen_string_literal: true

require 'dockingstation'

describe DockingStation do
  subject(:station) { described_class.new }
  let(:bike) { double(broken?: false) }
  let(:broken_bike) { double(broken?: true) }

  describe '#initialize' do
    it 'is initialized with a default capacity' do
      expect(station.capacity).to eq described_class::DEFAULT_CAPACITY
    end
    it 'has a variable capacity' do
      described_class::DEFAULT_CAPACITY.times do
        station.dock(bike)
      end
      expect { station.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#dock' do
    it 'docks a bike object' do
      expect(station.dock(bike)).to eq [bike]
    end
    it 'raises an error when full' do
      station.capacity.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { station.release_bike }.to raise_error 'No bikes available'
    end
    it 'releases working bikes' do
      station.dock(bike)
      expect(station.release_bike).to be bike
    end
    it 'will not release a bike if it is broken' do
      station.dock(broken_bike)
      expect { station.release_bike }.to raise_error 'No bikes available'
    end
  end
end
