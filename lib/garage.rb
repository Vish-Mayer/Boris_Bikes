# frozen_string_literal: true

class Garage
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def fix_bikes
    @bikes.map(&:fix)
  end
end
