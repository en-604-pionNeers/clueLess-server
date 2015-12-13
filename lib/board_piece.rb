require 'card'

class BoardPiece < Card
  attr_accessor :item_name 

  def initialize(character_id, character_name = nil)
    super(character_id, CardType::SUSPECT)
    self.item_name  = character_name || character_id
  end
end