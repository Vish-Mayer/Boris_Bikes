# frozen_string_literal: true

class Bike
  def broken?
    @broken
  end

  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end

  def fix
    @broken = false
  end
end
