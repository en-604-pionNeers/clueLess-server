require 'card'

class RoomCard < Card
  attr_accessor :item_name 

  def initialize(room_id, room_name)
    super(room_id, CardType::ROOM)
    self.item_name  = room_name
  end
end