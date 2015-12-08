require 'board_actions'

class Player < BoardAction

  attr_accessor :name
  attr_accessor :cards
  attr_accessor :id
  attr_accessor :disabled

  def initialize(name, id, cardset)
    @name = name
    @id = id
    @disabled = false;
    @cards = {:weapon => cardset.random_weapon_card,
              :suspect => cardset.random_suspect_card,
              :room => cardset.random_room_card}
  end
end