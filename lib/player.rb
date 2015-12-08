require 'board_actions'
require 'board_piece'

class Player < BoardAction
  attr_accessor :name
  attr_accessor :cards
  attr_accessor :id
  attr_accessor :disabled
  attr_accessor :board_piece
  attr_accessor :location_id

  def initialize(name, id, cardset, character_name)
    @name = name
    @id = id
    @disabled = false
    @cards = {:weapon => cardset.random_weapon_card,
              :suspect => cardset.random_suspect_card,
              :room => cardset.random_room_card}
    @board_piece = BoardPiece.new(character_name)
    @location_id = nil
  end
end