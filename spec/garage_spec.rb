# frozen_string_literal: true

require 'garage'

describe Garage do
  subject(:garage) { described_class.new }
  let(:broken_bike) { double(broken?: true, working?: false) }
  let(:garage_test) { double(bikes: [broken_bike]) }

  it { is_expected.to respond_to(:bikes) }

  describe '#initialize' do
    it 'is initialized with an array with no bikes' do
      expect(garage.bikes).to be_empty
    end
  end

  it { is_expected.to respond_to(:fix_bikes) }

  describe '#fix_bikes' do
    it 'is expected to fix a bike' do
      allow(garage_test).to receive(:fix_bikes)
      allow(broken_bike).to receive(:fix)
      expect(garage_test.fix_bikes).to eq broken_bike.fix
    end
  end
end
