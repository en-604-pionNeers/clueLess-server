class Location
  attr_accessor :name
  attr_accessor :vacant
  attr_accessor :player
  attr_accessor :id

  def occupy_location(player)
    @vacant = false
    @player = player
  end

  def unoccupy_location
    @vacant = true
    @player = nil
  end
end