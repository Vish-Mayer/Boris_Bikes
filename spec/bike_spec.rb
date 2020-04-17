require 'bike'

describe Bike do

  subject(:bike) { described_class.new }

  it { is_expected.to respond_to :broken? }
  it { is_expected.to respond_to :working? }

  it 'releases a working bike' do
    expect(bike).to be_working 
  end

  it { is_expected.to respond_to :report_broken }

  it 'can be reported broken' do
    bike.report_broken
    expect(bike).to be_broken
  end

  it { is_expected.to respond_to :fix }

  it 'can be fixed' do
    bike.report_broken
    bike.fix 
    expect(bike).to be_working
  end 
end
