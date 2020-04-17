class Van

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pick_up_broken(station)
    station.bikes.map { |bike| @broken_bikes << bike if bike.broken? }
    station.bikes.map { |bike| station.bikes.delete(bike) if bike.broken? }
  end

  def deliver_broken(garage)
    @broken_bikes.map { |bike| garage.bikes << bike }
    @broken_bikes.clear
  end
end
