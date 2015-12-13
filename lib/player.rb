require 'board_actions'
require 'board_piece'

class Player < BoardAction
  attr_accessor :cards
  attr_accessor :id
  attr_accessor :disabled
  attr_accessor :board_piece
  attr_accessor :location_id
  attr_accessor :player_in_turn
  attr_accessor :previous_moves

  def initialize(id, character_name)
    @id = id
    @cards = []
    @disabled = false
    @board_piece = BoardPiece.new(character_name)
    @location_id = nil
    @player_in_turn = false
    @previous_moves = []
  end
end