class Location
  attr_accessor :name
  attr_accessor :vacant

  def occupy_location
    @vacant = false
  end

  def unoccupy_location
    @vacant = true
  end
end