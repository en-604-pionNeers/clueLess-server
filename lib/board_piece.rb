require 'card'

class BoardPiece < Card
  attr_accessor :character_name

  def initialize(character_id, character_name = nil)
    super(character_id, CardType::SUSPECT)
    self.character_name = character_name || character_id
  end
end