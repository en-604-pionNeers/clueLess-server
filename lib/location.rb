class Location
  attr_accessor :name
  attr_accessor :vacant
  attr_accessor :players
  attr_accessor :id

  def occupy_location(player)
    @vacant = false
    @players = @players.push(player)
  end

  def unoccupy_location(player)
    @players.delete_if{|p| p.id == player.id}
    if @players.size == 0
      @vacant = true
    end
  end
end