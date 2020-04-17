class Van

  attr_reader :broken_bikes, :fixed_bikes

  def initialize
    @broken_bikes = []
    @fixed_bikes = [] 
  end

  def pick_up_broken(station)
    station.bikes.map { |bike| @broken_bikes << bike if bike.broken? }
    station.bikes.map { |bike| station.bikes.delete(bike) if bike.broken? }
  end

  def deliver_broken(garage)
    @broken_bikes.map { |bike| garage.bikes << bike }
    @broken_bikes.clear
  end

  def pick_up_fixed(garage)
    garage.bikes.map { |bike| @fixed_bikes << bike if bike.working? }
    garage.bikes.map { |bike| garage.bikes.delete(bike) if bike.working? }
  end

  def deliver_fixed(station)
    @fixed_bikes.map { |bike| station.bikes << bike }
    @broken_bikes.clear
  end 
end
