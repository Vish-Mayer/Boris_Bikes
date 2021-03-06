# frozen_string_literal: true

require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :capacity, :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise 'Docking station full' if full?

    bikes << bike
  end

  def release_bike
    unavailable if empty?
    @bikes.each { |bike| unavailable if bike.broken? }
    bikes.pop
  end

  private

  def unavailable
    raise 'No bikes available'
  end

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end
end
