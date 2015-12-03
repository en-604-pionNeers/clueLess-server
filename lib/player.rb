require 'board_actions'

class Player < BoardAction

  attr_accessor :name
  attr_accessor :cards
  attr_accessor :id

  # I think we have game_piece set up separately from
  # Player in our diagrams, not sure it makes sense to do it that way
  # But feel free to remove it from here
  attr_accessor :game_piece

  def initialize(name, id)
    @name = name
    @id = id
  end
end