require 'garage'

describe Garage do
  subject(:garage) { described_class.new }
  let(:broken_bike) {double(:broken? => true)}
  let(:garage_test) {double(:bikes => [broken_bike])}


  describe '#initialize' do
    it 'is initialized with an array with no bikes' do
      expect(garage.bikes).to be_empty
    end
  end

  it { is_expected.to respond_to(:fix_bikes) }

  describe '#fix_bikes' do
    it 'is expected to fix a bike' do
      allow(garage_test).to receive(:fix_bikes)
      garage_test.fix_bikes
      expect(garage_test.bikes).to eq [broken_bike]
    end
  end
end
