require 'rooms'
require 'hall'

class Board

    attr_accessor :halls
    attr_accessor :rooms

  def initialize
    @rooms = {}
    ROOM_LAYOUT[:rooms].each do |room|
      @rooms[room[:name]] = Room.new(room)
    end
    @halls = {}
    HALLS.each do |hall|
      @halls[hall] = Hall.new(hall)
    end
  end
end