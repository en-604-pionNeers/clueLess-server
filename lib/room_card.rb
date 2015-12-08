require 'card'

class RoomCard < Card
  attr_accessor :room_name

  def initialize(room_id, room_name)
    super(room_id, CardType::ROOM)
    self.room_name = room_name
  end
end