class Bike

  def broken?
    @broken
  end

  def working?
    @broken == nil 
  end

  def report_broken
    @broken = true
  end

  def fix
    @broken = false
  end
end
