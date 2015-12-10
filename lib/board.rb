require 'rooms'
require 'hall'

class Board

    attr_accessor :halls
    attr_accessor :rooms

  def initialize
    @rooms = {}
    ROOM_LAYOUT[:rooms].each do |room|
      @rooms[@rooms.count] = Room.new(room, @rooms.count)
    end
    @halls = {}
    HALLS.each do |hall|
      @halls[@rooms.count + @halls.count] = Hall.new(hall, @rooms.count + @halls.count)
    end
  end

  def move_player(player, location_id)
    location_id = Integer(location_id)
    if !@rooms[location_id].nil?
      room = @rooms[location_id]
      if room.vacant
        unoccupy(player.location_id) unless player.location_id.nil?
        player.location_id = location_id
        room.occupy_location(player)
      else
        return false
      end
    else
      hall = @halls[location_id]
      if hall.vacant
        unoccupy(player.location_id) unless player.location_id.nil?
        player.location_id = location_id
        @halls[location_id].occupy_location(player)
      else
        return false
      end
    end
    true
  end

  def unoccupy(location_id)
    location_id = Integer(location_id)
    if !@rooms[location_id].nil?
      @rooms[location_id].unoccupy_location
    else
      @halls[location_id].unoccupy_location
    end
  end

  def to_json_map
    {
      rooms: rooms.collect{|k,v| v},
      halls: halls.collect{|k,v| v}
    }
  end

end