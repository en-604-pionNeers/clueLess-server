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
    puts "The location id: #{location_id}"
    puts "the rooms: #{@rooms[location_id]}"
    if !@rooms[location_id].nil?
      @rooms[Integer(player.location_id)].unoccupy_location unless player.location_id.nil?
      player.location_id = location_id
      @rooms[location_id].occupy_location(player)
    else
      @halls[Integer(player.location_id)].unoccupy_location unless player.location_id.nil?
      player.location_id = location_id
      @halls[location_id].occupy_location(player)
    end
  end
end