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
    puts "THE ROOMS: #{@rooms}"
    @halls = {}
    HALLS.each do |hall|
      @halls[hall] = Hall.new(hall)
    end
    puts "THE HALLS: #{@halls}"
  end
end